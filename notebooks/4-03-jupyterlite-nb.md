---
jupytext:
  formats: md:myst
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

# `jupyterlite`

each comes in two flavours, with or without a notebook name

+++

## jlab no args

```{jupyterlite}
:theme: JupyterLab Light
:width: 100%
:height: 500px
:prompt: jupyterlite no args
:prompt_color: green
```

+++

## jlab on hello-world.ipynb

omitting the theme

```{jupyterlite} hello-world.ipynb
:width: 100%
:height: 500px
:prompt: jupyterlite on one notebook
:prompt_color: blue
```
