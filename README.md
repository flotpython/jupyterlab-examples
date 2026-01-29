# migration to myst / JB2

- [migration to myst / JB2](#migration-to-myst--jb2)
  - [execution of code cells](#execution-of-code-cells)
    - [ipywidgets](#ipywidgets)
  - [nbautoeval (won't work in a static site anyway, unless re-written to use browser-embedded python)](#nbautoeval-wont-work-in-a-static-site-anyway-unless-re-written-to-use-browser-embedded-python)
  - [static stuff](#static-stuff)
  - [slug-ed URLs](#slug-ed-urls)
  - [corrections](#corrections)
  - [custom themes](#custom-themes)
  - [favicons](#favicons)
  - [badges](#badges)
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

|                  course |     orga     |         tool          |     comment      |                                             URL | self<br>hosted |
|------------------------:|:------------:|:---------------------:|:----------------:|------------------------------------------------:|----------------|
|                 `intro` |  `ue12-p25`  | astro + <br>starlight |       done       |                 https://intro.info-mines.paris/ |                |
|             `numerique` |  `ue12-p25`  |          jb2          |       done       |             https://numerique.info-mines.paris/ |                |
|        `numerique-exos` | `flotpython` |          jb2          |       done       |        https://numerique-exos.info-mines.paris/ |                |
|                `slides` | `flotpython` |          jb2          | done <br> no PDF |                https://python.info-mines.paris/ |                |
|           `python-exos` | `flotpython` |          jb2          |       done       |           https://python-exos.info-mines.paris/ | yes            |
|                   `git` |  `ue12-p25`  |          jb2          |       done       |                   https://git.info-mines.paris/ |                |
|              `frontend` |  `ue22-p25`  |          jb2          |       done       |              https://frontend.info-mines.paris/ | yes            |
|               `backend` |  `ue22-p25`  |          jb2          |       done       |               https://backend.info-mines.paris/ |                |
| `backend-fastapi-notes` |  `ue22-p25`  | next + <br> codehike  |       done       | https://backend-fastapi-notes.info-mines.paris/ |                |
| `backend-flask-chatapp` |  `ue22-p25`  | next + <br> codehike  |       done       | https://backend-flask-chatapp.info-mines.paris/ |                |
|   `jupyterlab-examples` | `flotpython` |          jb2          |       done       |   https://jupyterlab-examples.info-mines.paris/ | yes            |
|         MOOC (`course`) | `flotpython` |          jb2          |       done       |           https://mooc-python.info-mines.paris/ | yes            |

let's summarize the pain points

## execution of code cells

- we now know how to embed a jupyterlite instance in the page; not clear however
  how to take advantage of that

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2318)](https://github.com/jupyter-book/mystmd/issues/2318)
[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2319)](https://github.com/jupyter-book/mystmd/issues/2319)

+ issue to open about thebe buttons that behave real odd

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2392)](https://github.com/jupyter-book/mystmd/issues/2392)


### ipywidgets

related to the above; with a jlite kernel on board one can produce interactive widgets; but that seems to exclude a build-time execution ?

## nbautoeval (won't work in a static site anyway, unless re-written to use browser-embedded python)

- [ ] interactive visualizations (this being said it was already not working under jb1)

## static stuff

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/1921)](https://github.com/jupyter-book/mystmd/issues/1921)

this is a problem for - at least - embedded HTML pages like folium-generated maps; see

[https://github.com/jupyter-book/mystmd/issues/189#issuecomment-2725195113](https://github.com/jupyter-book/mystmd/issues/189#issuecomment-2725195113)

other relevant entries
- https://github.com/jupyter-book/mystmd/issues/1921  
  and more specifically https://github.com/jupyter-book/mystmd/issues/1921#issuecomment-3434122417
- https://github.com/jupyter-book/mystmd/issues/1196
- https://github.com/jupyter-book/mystmd/pull/2597

## slug-ed URLs

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2316)](https://github.com/jupyter-book/mystmd/issues/2316)

## corrections

- there remains an issue with **hidden content being searchable**; see  
[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2312)](https://github.com/jupyter-book/mystmd/issues/2312)
- currently the trick for teachers to display corrections is relying on **`tampermonkey`** on an individual basis  
  using our custom theme could be the way to go do make it more widely available

## custom themes

for a new scheme to expose built-in themes as GH releases

- [![Issue Status](https://img.shields.io/github/pulls/detail/state/jupyter-book/myst-theme/659)](https://github.com/jupyter-book/myst-theme/issues/659)
- [![Issue Status](https://img.shields.io/github/pulls/detail/state/jupyter-book/myst-enhancement-proposals/34)](https://github.com/jupyter-book/myst-enhancement-proposals/issues/34)

## favicons

used a workaround which is to use .ico files instead of .svg

<!-- 
that was only about using .ico format I believe
[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/925)](https://github.com/jupyter-book/mystmd/issues/925) -->

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/1985)](https://github.com/jupyter-book/mystmd/issues/1985)

## badges

are evaluated at build-time, not at read time

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2320)](https://github.com/jupyter-book/mystmd/issues/2320)

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
