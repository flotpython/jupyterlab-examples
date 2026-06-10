---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
  language: python
language_info:
  name: python
  pygments_lexer: ipython3
  nbconvert_exporter: python
---

# mystmd xref bug reproduction

see https://github.com/jupyter-book/mystmd/issues/2120

+++

## define a cell with a label

```{code-cell} ipython3
#| label: the-label

print("hello world")
```

## embed the content

[hover here to see the output of the labeled cell i.e. `hello world`](#the-label)
