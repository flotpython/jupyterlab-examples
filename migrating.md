# migrating out of JB1

- [migrating out of JB1](#migrating-out-of-jb1)
  - [execution of code cells](#execution-of-code-cells)
    - [ipywidgets](#ipywidgets)
  - [nbautoeval (won't work in a static site anyway, unless re-written to use browser-embedded python)](#nbautoeval-wont-work-in-a-static-site-anyway-unless-re-written-to-use-browser-embedded-python)
  - [static stuff](#static-stuff)
  - [slug-ed URLs](#slug-ed-urls)
  - [corrections](#corrections)
  - [custom themes](#custom-themes)
  - [favicons](#favicons)
  - [styling](#styling)
  - [itables](#itables)

mostly all repos have moved to jb2 as of now

<style>
  .todo {
    background-color: #ffdddd;
    border-left: 6px solid #f44336;
    margin-bottom: 15px;
    padding: 10px 15px;
  }
</style>

|                  course |     orga     |       tool        |                    comment                    |                                               URL |
|------------------------:|:------------:|:-----------------:|:---------------------------------------------:|--------------------------------------------------:|
|                 `intro` |  `ue12-p25`  |       astro + <br>starlight      |                     done                      |                   https://intro.info-mines.paris/ |
|             `numerique` |  `ue12-p25`  |        jb2        |                     done                      |               https://numerique.info-mines.paris/ |
|        `numerique-exos` | `flotpython` |        jb2        |                     done                      |          https://numerique-exos.info-mines.paris/ |
|                `slides` | `flotpython` |        jb2        |                     done                      |                  https://python.info-mines.paris/ |
|           `python-exos` | `flotpython` |        jb2        |                     done                      |             https://python-exos.info-mines.paris/ |
|                   `git` |  `ue12-p25`  |        jb2        |                     done                      |                     https://git.info-mines.paris/ |
|              `frontend` |  `ue22-p25`  |        jb2        |                     done                      |                https://frontend.info-mines.paris/ |
|               `backend` |  `ue22-p25`  |        jb2        |                     done                      |                 https://backend.info-mines.paris/ |
| `backend-fastapi-notes` |  `ue22-p25`  | codehike<br>+next |                     done                      |   https://backend-fastapi-notes.info-mines.paris/ |
| `backend-flask-chatapp` |  `ue22-p25`  |     codehike      | <span class=todo>move to new domain</span> | https://ue22-p24.github.io/backend-flask-chatapp/ |
|   `jupyterlab-examples` | `flotpython` |        jb2        | <span class=todo>move to new domain</span> | https://flotpython.github.io/jupyterlab-examples/ |

let's summarize the pain points

## execution of code cells

- we now know how to embed a jupyterlite instance in the page; not clear however
  how to take advantage of that

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2318)](https://github.com/jupyter-book/mystmd/issues/2318)
[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2319)](https://github.com/jupyter-book/mystmd/issues/2319)


### ipywidgets

related to the above; with a jlite kernel on board one can produce interactive widgets; but that seems to exclude a build-time execution ?

## nbautoeval (won't work in a static site anyway, unless re-written to use browser-embedded python)

- [ ] interactive visualizations (this being said it was already not working under jb1)

## static stuff

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/1921)](https://github.com/jupyter-book/mystmd/issues/1921)

this is a problem for - at least - embedded HTML pages like folium-generated maps; see

- [ ] [https://github.com/jupyter-book/mystmd/issues/189#issuecomment-2725195113](https://github.com/jupyter-book/mystmd/issues/189#issuecomment-2725195113)

## slug-ed URLs

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2316)](https://github.com/jupyter-book/mystmd/issues/2316)

## corrections

- there remains an issue with **hidden content being searchable**; see  
[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2312)](https://github.com/jupyter-book/mystmd/issues/2312)
- the `hidden` flag now works as expected
- currently relying on tampermonkey on an individual basis, but using a custom theme could be the way to go do make it widely available

## custom themes

-> see https://github.com/jupyter-book/mystmd/issues/2317

for a new scheme to expose built-in themes as GH releases

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2317)](https://github.com/jupyter-book/mystmd/issues/2317)

## favicons

used a workaround which is to use .ico files instead of .svg

## styling

we have a common style_jb2.css that takes care of most details; might need some further adjustments one day but good enough for now

- [ ] styling
  - [x] lists
  - [ ] cells
    - [ ] outline output cells
    - [ ] outline input cells (blue is like untyped admonitions...)
  - [ ] outline inline code
  - [ ] pandas dataframes
    - [ ] are not centered; not exactly serious either
    - [ ] hovering used to outline the whole row, now just the first cell in the row

## itables

not quite sure where we are there, we may need to add a recipe notebook in here to assess the situation
