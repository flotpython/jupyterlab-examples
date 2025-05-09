# migrating out of JB1

i.e. to JB2 or astro/starlight and/or codehike

## currently pending at mystmd

### ipywidgets

everything `ipywidgets` seems to be doomed ?  
was a bit the same with jb1, although not that serious  
this is a problem for

- [ ] nbautoeval (won't work in a static site anyway, unless re-written to use browser-embedded python)
- [ ] interactive visualizations (this being said it was already not working under jb1)

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

| course | orga | now | target | comment | URL |
|:------:|:----:|:---:|:------:|:-------:|:---:|
| jupyterlab-examples | flotpython | jb2 | | **DONE** | https://flotpython.github.io/jupyterlab-examples |
| intro | ue12-p25 | astro |  | **DONE** | https://ue12-p25.github.io/intro |
| numerique | ue12-p25 | jb2 | | **DONE** | https://ue12-p25.github.io/numerique |
| git | ue12-p25 | was jb1 | astro? | not-started | ... |
| slides | flotpython | jb2 | | **DONE** | https://flotpython.github.io/slides |
| exos-python | flotpython | jb1 | jb2 ? | check for limitations | https://flotpython.github.io/exos-python |
| exos-ds | flotpython | jb1 | jb2 ? | check for limitations | https://flotpython.github.io/exos-ds |
| web (rename as frontend) | ue22-p25 | was jb1 | astro? | not-started| ... |
| backend | ue22-p25 | was remarkjs | astro? | not-started| ... |
| backend-flask-chatapp | ue22-p25 | was codehike | same | not-started| ... |
| backend-fastapi-notes | ue22-p25 | just Python for now | codehike | not-started| ... |

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
