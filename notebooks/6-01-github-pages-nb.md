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

## naming scheme

the result gets published under a URL like `https://the-orga.github.io/the-repo/`  
like .e.g this one is on  
https://flotpython.github.io/jupyterlab-examples/

## the action file

normally all project could share the same action file, that we have named `myst-topages.yml`  
note that projects based on astro will use instead `astro-to-pages.yml`

this file is part of the ones monitored by the `commons` tool, that helps us keep common files in sync across projects

### how to set it up

on a new project, it suffices to

- adopt the common action file
- and enable Pages at github, see the action file for the details

monitor runs under the `Actions` tab of the repo

## the caveats

###  `main` branch only

as compared to the `readthedocs` approach, GH Pages has one major caveat: it
does **not support several branches** to be built and accessible at the same
time

### need for a BASE_URL

given the naming scheme, we need to set a `BASE_URL` in the actions file, so that
the generated links are correctly generated under the `the-repo/` folder
