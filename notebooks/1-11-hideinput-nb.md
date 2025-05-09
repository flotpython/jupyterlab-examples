---
jupytext:
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

# hide-input

+++

this may require some more checking but IIRC the `jupyterlab-courselevels` may be required for this to work properly

+++

## code cells

+++

````{caution}
the next code cells are marked as `metadata.tags` contains `hide-input`

on a historical note: in nbclassic this used to be marked with `metadata.hide_input=true`
````

+++

````{note}

* thanks to (1) the jb HTML output will come as a collapsible
* thanks to the `jupyterlab-courselevels` extension, with (1) the code cell input should be hidden in jupyterlab (and hopefully nb7 as well)
* because of (2) the cell input will not show under nbclassic  
  this requires the jupyter contrib extensions installed, and the hide-input extension enabled
````

+++

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 2 hide-input cells below

```{code-cell} ipython3
:tags: [remove-input]

# this text should be hidden
print("should show the output but not the code")
```

```{code-cell} ipython3
:tags: [remove-input]

# this text should be hidden
print('and another hide-input cell')
```

↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ hide-input cells above

+++

## 2 visible cells, one text and one code

+++

with one markdown cell (this very one) and one code cell

```{code-cell} ipython3
# code (visible)
print("hello")
```

## same with hide-input

below we repeat these 2 cells, with hide-input set

+++ {"tags": ["remove-input"]}

a (hidden-input) markdown cell wont show up at all

```{code-cell} ipython3
:tags: [remove-input]

# code (hidden-input) will just produce an output, but won't show up
print("hello")
```
