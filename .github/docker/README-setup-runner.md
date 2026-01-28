# self-hosted runner setup

## dockerhub

our image is at

`dockerhub.pl.sophia.inria.fr/python-nodejs:latest`

### publish the image

```
# as boxtops@root

cd
# if needed
git clone https://github.com/flotpython/jupyterlab-examples

cd ~/jupyterlab-examples/.github/docker

# will build & push the image to dockerhub.pl.sophia.inria.fr
# the docker login as admin has been made once and for good as the root user there
./rebuild.sh

# check available tags
curl -u admin:$password https://dockerhub.pl.sophia.inria.fr/v2/_catalog
curl -u admin:$password https://dockerhub.pl.sophia.inria.fr/v2/python-nodejs/tags/list
```

## general comments

### right in the host context

- the self-hosted runner is required to run as a regular user (not root), this
  is enforced by the GH runner code
- as this needs a minimal amount of isolation between runs, we've tried using
  `conda` or `pixi` to provide that isolation; however, the bottom line is
  **it's not a good idea**
- running right inside the host context is **doable**, and in a first stage
  we've used that for the `frontend` course on `bigjack`
- however this is both **fragile** (not sure how several concurrent runs would
  behave) and also - very - **slow**

### in a container

- for that reason we have explored containerization options
- ***BUT*** using **podman** turns out to be **overcomplex**, due to the need to
  run the runner as a non-root user - don't do that !
- for that reason we have switched to using **regular docker**
- btw: that is a bit unfortunate because we had `thermals` that could have done the
  job pretty well, but well, c'est la vie...
- using `boxtops` then instead
- also, it is important that the container itself must not run as root either,
  because `myst --execute` will then have its `jupyter-server` fail silently in
  that case (the logs would report that the `--allow-root` flag is missing)

### need to use a publicly available image

- the GH action that sets up the container insists on doing a `docker pull`
  first, there does not seem to be a way to skip that
- hence the need to push the image to a publicly available docker registry
- we have setup dockerhub on `dockerhub.pl.sophia.inria.fr` for that purpose  
  it is requires login for publication but is configured to allow anonymous
  pulls

### the image

- this is expected to be run on boxtops  
  does not really matter much, but it does require the `docker login` step
- is published as `dockerhub.pl.sophia.inria.fr/python-nodejs:latest`
- rebuild with
  ```bash
  cd  ~/jupyterlab-examples/.github/docker
  git pull
  ./rebuild.sh
  ```
- this uses `Dockerfile.python-nodejs`
- note that the user `github-actions` is created with uid/gid 1001 (see also
  below)

## setup steps on the GH side

### allow public repos to use self-hosted runners

- ***IMPORTANT*** - do it once for each orga !  
  you also need to allow public repos to use self-hosted runners in the
  organization settings on GitHub

  `github.com/$ORGA` -> Settings -> Actions -> Runner groups -> Default Group -> Allow public repositories

## setup on the runner host

***IMPORTANT***: make sure you run genuine docker and not podman

```bash
dnf install -y docker-cli
systemctl enable --now docker
```

### runner cleanup steps

if needed: on the GH site, go to `github.com/$ORGA`  
> -> Settings -> Actions -> Runners

and remove the runners you don't need anymore

then on the host machine, as root:

```bash
# spot running services
systemctl | grep github-actions-runner

# stop them all - or be specific if only for one orga
systemctl stop github-actions-runner@*

# disable them all - same
systemctl disable github-actions-runner@*

# remove the service files - same
rm /etc/systemd/system/github-actions-runner@*.service

# reload systemd
systemctl daemon-reload

# remove the runner folders - if it's the last orga that had a runner on this box
userdel -rf github-actions
```

## runner setup steps

### once at least as root

it's important that `github-actions` user is created with **the same uid/gid** as the image !
otherwise there will be permission issues and the container won't even start properly !

```bash

# create a user `github-actions` on the machine
groupadd -g 1001 github-actions
sudo useradd -u 1001 -g 1001 -d /containers/github-actions -s /bin/bash github-actions

# add it to the `docker` group
usermod -aG docker github-actions
```

### as github-actions - for one orga

```bash
# login as `github-actions`
su - github-actions

# create a folder for the orga runner
ORGA=ue22-p25
mkdir github-actions-runner-${ORGA}
cd github-actions-runner-${ORGA}
```

### create the runner

-  go to github orga page  
   -> Settings -> Actions -> Runners -> New self-hosted runner
- select Linux / x64
- Download:
  - copy-&-paste **but WITHOUT the creation of `actions-runner` folder**
    turns out in our setup this is replaced by `github-actions-runner-${ORGA}`
- Configure:
  - you may add the 'docker' tag to the runner just in case

### back as root

- install the runner as a service

```bash
# if needed
cp ~/jupyterlab-examples/.github/scripts/github-actions-runner@.service /etc/systemd/system/github-actions-runner@.service
systemctl daemon-reload

ORGA=ue22-p25
systemctl enable --now github-actions-runner@${ORGA}
```

- double check the logs - esp. wrt to the extra folder level if you did create
  `actions-runner` folder  
  in that case rename the folder as appropriate
  ```bash
  journalctl -u github-actions-runner@${ORGA} -f
  ```

### how to check for current runners

one possible caveat is - done that already - is to attach the runner to a repo
instead of the orga...

to check the current runners for the orga (run on your laptop for authenticated
access):

```
ORGA=ue22-p25
gh api /orgs/$ORGA/actions/runners
```

in case of a mistake (if you attached the runner to a repo instead of the orga):

- you'll need to remove the token in the downloaded folder before you can re-run
  config.sh again; this requires to have the old token though
- another approach probably, remove the runner from the GH website, remove the
  folder and start over again

## historical notes

### first successful build with frontend (but without containerization)

- was done:
  - with orga=ue22-p25
  - using host context (no container)
  - relies on conda for isolation
  - runner box is bigjack
  - takes in the 12 minutes
  - and would probably be fragile if several runs were to be launched concurrently

### forget about pixi

too many issues with this idea of using pixi for isolation... just don't do that !  
the `pixi` branch in `flotpython/course` has some leftovers of that attempt

### remember to not try and run myst as root

one lesson though, it can't run as root (jupyter as spawned by myst would just fail)
