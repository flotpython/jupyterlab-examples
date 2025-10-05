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

# execution

this series of notebooks is for playing with execution modes in jupyter book

2 possible sets of options:

- run `myst` with or without `--execute`  
  when present, this runs the notebook at build-time  
  apparently this applies to all notebooks though
- enable an embedded JupyterLite kernel, which then allows to run the notebook
  in the browser, at read-time

pros and cons:

- 1/1 when both are enabled, apparently the build-time execution is done first and the run buttons don't do anything
- 1/0 if run at build-time, outputs are readily available without any manipulation
- 0/1 but when interactivity is needed, it's cool to rely on the embedded kernel so that dynamic behaviour like widgets or nbautoeval can be used
- 0/0 nothing is executed, hardly useful...

+++

## prerequisites

as far as I can tell what is required is this (double check in the GH actions and myst.yml)

### install NPM modules in the build environment

```bash
npm install -g mystmd thebe-core thebe thebe-lite
```

### enable jupyterlite for myst

in `myst.yml`, add

```yaml
  jupyter:
    lite: true
```

that is to say `project.jupyter.lite = true`

## on a notebook basis

not sure if one can enable execution on a per-notebook basis
