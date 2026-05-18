# migration to myst / JB2

- [migration to myst / JB2](#migration-to-myst--jb2)
  - [execution model](#execution-model)
    - [interactive outputs / ipywidgets](#interactive-outputs--ipywidgets)
    - [corollary: nbautoeval](#corollary-nbautoeval)
  - [static stuff](#static-stuff)
  - [slug-ed URLs](#slug-ed-urls)
  - [corrections](#corrections)
  - [custom themes](#custom-themes)
  - [favicons](#favicons)
  - [badges](#badges)
  - [styling](#styling)
  - [itables](#itables)
  - [multi-langs notebook](#multi-langs-notebook)
  - [config and doc](#config-and-doc)

mostly all repos have moved to jb2 as of now

<style>
  .todo {
    background-color: #ffdddd;
    border-left: 6px solid #f44336;
    margin-bottom: 15px;
    padding: 10px 15px;
  }
</style>

|                  course |     orga     |         tool          | comment |                                             URL |
|------------------------:|:------------:|:---------------------:|:-------:|------------------------------------------------:|
|                 `intro` |  `ue12-p25`  | astro + <br>starlight |  done   |                 https://intro.info-mines.paris/ |
|             `numerique` |  `ue12-p25`  |          jb2          |  done   |             https://numerique.info-mines.paris/ |
|        `numerique-exos` | `flotpython` |          jb2          |  done   |        https://numerique-exos.info-mines.paris/ |
|                `slides` | `flotpython` |          jb2          |  done   |                https://python.info-mines.paris/ |
|           `python-exos` | `flotpython` |          jb2          |  done   |           https://python-exos.info-mines.paris/ |
|                   `git` |  `ue12-p25`  |          jb2          |  done   |                   https://git.info-mines.paris/ |
|              `frontend` |  `ue22-p25`  |          jb2          |  done   |              https://frontend.info-mines.paris/ |
|               `backend` |  `ue22-p25`  |          jb2          |  done   |               https://backend.info-mines.paris/ |
| `backend-fastapi-notes` |  `ue22-p25`  | next + <br> codehike  |  done   | https://backend-fastapi-notes.info-mines.paris/ |
| `backend-flask-chatapp` |  `ue22-p25`  | next + <br> codehike  |  done   | https://backend-flask-chatapp.info-mines.paris/ |
|   `jupyterlab-examples` | `flotpython` |          jb2          |  done   |   https://jupyterlab-examples.info-mines.paris/ |
|         MOOC (`course`) | `flotpython` |          jb2          |  done   |           https://mooc-python.info-mines.paris/ |

let's summarize the pain points

## execution model

- we now know how to embed a jupyterlite instance in the page; 
- we know how to skip execution on one specific notebook

however
- how much sense does it make to execute at build time AND and read-time ?
- in practical terms one would like to tag notebooks as being either
  - 1. not executed
  - 2. executed at build time (for static outputs)
  - 3. executed at read time (for interactive outputs)
- currently as far as I understand the only option to mix types 2 and 3 is
  - run `myst --execute` to execute all notebooks at build time
  - and tag `skip_execution: true` for the notebooks that should be executed
    at read time
  - and also add a jlite kernel in those same notebooks

I'd argue this configuration scheme is suboptimal; I'd rather have a single tag to choose between the 3 options; something like

```yaml
execution: none | build-time | read-time
```

with possibly a global tag to select which kind of embedded execution (jlite or binder or whatever) that could also be overridable at the notebook level

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2318)](https://github.com/jupyter-book/mystmd/issues/2318)
[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2319)](https://github.com/jupyter-book/mystmd/issues/2319)

[![Issue Status](https://img.shields.io/github/issues/detail/state/jupyter-book/mystmd/2392)](https://github.com/jupyter-book/mystmd/issues/2392)

### interactive outputs / ipywidgets

loosely related to the above;  
with a jlite kernel on board one can produce interactive widgets;  
but is it possible to get the same with build-time execution ?

```{note}
this being said, interactive visualizations was already not working under jb1
  iirc
```

### corollary: nbautoeval

won't work in a static site anyway, unless re-written to use browser-embedded
python; we need Python to correct the

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

I have a sample notebook in this very repo  
itables kicks in when the nb is executed at read-time

## multi-langs notebook

in the context of the Rust course, I have tried to mix Python and Rust code in the same notebook

I believe this was working in jb1 ?

in any case when I do:
- set bash as the default language for the notebook
- add a regular code cell -> bash of course
- add a `:::{code-cell} rust` cell : also sent to bash

## config and doc

it is often hard to tell from the doc whether a given setting:

- must be set on the notebook itself and/or the global config
- and also sometimes at which level of the settings it is supposed to be set - i.e. in the `project` or `site` section of the config ?
