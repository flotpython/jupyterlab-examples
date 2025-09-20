# migrating out of JB1

i.e. to JB2 or astro/starlight and/or codehike

## currently pending at mystmd

### ipywidgets

everything `ipywidgets` seems to be doomed ?  
was a bit the same with jb1, although not that serious  
this is a problem for

- [ ] nbautoeval (won't work in a static site anyway, unless re-written to use browser-embedded python)
- [ ] interactive visualizations (this being said it was already not working under jb1)

```{admonition}  need to dig more
:class: warning

I have seen references to using `jupyterlite` to embed a mini-jupyter in the page, which would solve the problem; 
but I have not found any working example yet.
```

### static stuff

things in `_static` don't get found ?  
this is a problem for - at least - embedded HTML pages like folium-generated maps; see

- [ ] [https://github.com/jupyter-book/mystmd/issues/189#issuecomment-2725195113](https://github.com/jupyter-book/mystmd/issues/189#issuecomment-2725195113)
- [ ] and/or [https://github.com/jupyter-book/mystmd/issues/1921](https://github.com/jupyter-book/mystmd/issues/1921)

### external urls in TOC

```
⚠️  myst.yml URLs in table of contents are not yet supported:
https://flotpython-exos-ds.readthedocs.io/en/main/ds-tps/images/README-images1-nb.html
```

### slug-ed URLs

really don't like this new trend of botching filenames into slugs;

https://github.com/jupyter-book/mystmd/issues/189#issuecomment-2726427697

https://github.com/jupyter-book/mystmd/issues/670#issuecomment-2726442232

## tooling

- [x] Transform jlab-examples
- [x] Transform flotpython-slides

## what we have now

<style>
  .todo {
    background-color: #ffdddd;
    border-left: 6px solid #f44336;
    margin-bottom: 15px;
    padding: 10px 15px;
  }
</style>

|                  course |     orga     |   tool   |         comment         | URL                                               |
|------------------------:|:------------:|:--------:|:-----------------------:|--------------------------------------------------:|
|                 `intro` |  `ue12-p25`  |  astro   |          done           | https://intro.info-mines.paris/                   |
|             `numerique` |  `ue12-p25`  |   jb2    |          done           | https://numerique.info-mines.paris/               |
|        `numerique-exos` | `flotpython` |   jb2    | done <br> limitations ? | https://numerique-exos.info-mines.paris/          |
|                `slides` | `flotpython` |   jb2    |          done           | https://python.info-mines.paris/                  |
|           `python-exos` | `flotpython` |   jb2    |  done<br> limitations ? | https://python-exos.info-mines.paris/             |
|                   `git` |  `ue12-p25`  |   jb2    |          done           | https://git.info-mines.paris/                     |
|              `frontend` |  `ue22-p25`  |   jb2    |          done           | https://frontend.info-mines.paris/                |
|               `backend` |  `ue22-p25`  |   jb2    |          done           | https://backend.info-mines.paris/                 |
|   `jupyterlab-examples` | `flotpython` |   jb2    |          done           | https://flotpython.github.io/jupyterlab-examples/ |
| `backend-flask-chatapp` |  `ue22-p25`  | codehike |       not-started       | ...                                               |
| `backend-fastapi-notes` |  `ue22-p25`  |   ???    |       not-started       | ...                                               |

## Notes on domains and URLs

- the simple case is with the `ue12-p25` courses
  they are now bound to their own domain, e.g. <https://numerique.info-mines.paris/>
- same for `ue22-p25`; that orga is also bound to the info-mines.paris domain in GH, so all is well
- for the `flotpython` orga, we have no custom domain right now; there are several options
  - [ ] use the `flotpython.github.io` domain, which is bound to the flotpython orga  
    - this would give URLs like <https://flotpython.github.io/exos-python/>
    - this requires defining BASEURL to be the project name in each repo's gh action (the default when using jb2 template action)
  - [ ] use a separate custom domain, e.g. <https://exos-python.flotpython.io/>  
    - this would require buying and maintaining a domain name, and setting up GH pages to use it
    - changes would be needed in the repos themselves (so that the GH action does not set BASEURL to be the project name)
  - [x] reuse the `info-mines.paris` domain, e.g. <https://python-exos.info-mines.paris/>  
    - [x] this would also require setting up the GH orga to bind to that domain (no big deal)
    - [x] same comment about BASEURL as above

```{admonition} apex domain

 Note that the toplevel domain `info-mines.paris` is implemented as a
 redirect to <https://intro.info-mines.paris/> through this repo-redirect
 https://github.com/ue12-p25/portal
```

## JB1

## pros

- [ ] all supports were using this as of p24
- [ ] easy recipe to publish on readthedocs; which supports several branches simultaneously

### cons

- [ ] **no longer supported**
- [ ] runs on sphinx, sloowww
- [ ] can **only** publish on readthedocs ? (probably doable on github pages too but we have no experience of that as of yet)

---

## JB2

### pros

- modern, and supported, alternative to jb1
- execute codes in notebooks
- fast DX
- see also the doc in <https://mystmd.org/guide/directives>

### cons

- must publish on github pages for now, and so no multiple branches at the same time

### pain points / todo list

- [ ] still misses the cheat shortcut to get corrections
  - [ ] need to find a way to embed a piece of JS
  - [ ] the corriges do not seem to be evaluated like they were under sphinx/jb1
  - [ ] put it all together; may have an impact on styling...
- [ ] favicons on the published end ? <https://ue12-p25.github.io/numerique/> has none but the local one is fine

- [ ] styling
  - [x] lists
  - [ ] cells
    - [ ] outline output cells
    - [ ] outline input cells (blue is like untyped admonitions...)
  - [ ] outline inline code
  - [ ] pandas dataframes
    - [ ] are not centered; not exactly serious either
    - [ ] hovering used to outline the whole row, now just the first cell in the row

#### second order

- [ ] not sure about the slug thing; can we override the default function ?
- [ ] would be nice to be able to rename `myst.yml` into `_myst.yml`
- [ ] inline images ? right now they cause a new paragraph to be created
- [ ] jupyterlite embeddings not working at all

#### fixed

- [x] equation from
  http://localhost:3000/numpy-tp-dices-advanced-nb#version-pour-les-d-butants
  rendered oddly (but better than jb1 for that matter)  
  fixed by adding an extra {equation} environment around it

---

## astro / starlight

### pros

- [ ] large community
- [ ] very robust
- [ ] very complete

### cons

- [ ] not notebooks, code is not executed...
