---
jupytext:
  encoding: '# -*- coding: utf-8 -*-'
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
language_info:
  name: python
  nbconvert_exporter: python
  pygments_lexer: ipython3
---

# GH pages (jb2)

with jb1 we were using rtfd.io  
like for example the historical version of this project may be still found at  
 https://flotpython-jupyterlab-examples.readthedocs.io/

however this no longer seems to be an option with jb2 so we're going for github pages and github actions

## naming scheme: info-mines.paris

we now host almost all courses under a unique domain `info-mines.paris`  
even `python`, `numerique-exos` and `python-exos` that are hosted under the `flotpython` github organization

one exception though (for now at least)  
this very jupyterlab-examples project for now is still under `github.io` at
https://flotpython.github.io/jupyterlab-examples/

## the gh action file

normally all project could share the same action file
this file is part of the ones monitored by the `commons` tool, that helps us keep common files in sync across projects

(this of course does not apply to `intro` which is based on astro/starlight)

## how to set it up

on a new project, it suffices to

- adopt the common action file
- and enable Pages at github, see the action file for the details
- then monitor successive runs under the `Actions` tab of the repo

## the caveats

###  `main` branch only

as compared to the `readthedocs` approach, GH Pages has one major caveat: it
does **not support several branches** to be built and accessible at the same
time

### no longer need a BASE_URL

when hosting under a subpath under `github.io`, we needed to set a `BASE_URL` in the actions file, so that
the generated links are correctly generated under the `the-repo/` folder

this is no longer needed when hosting under a custom domain like
`info-mines.paris`, as the landing page is then at the root of the domain
