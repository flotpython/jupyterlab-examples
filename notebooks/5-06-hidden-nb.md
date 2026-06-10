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
  pygments_lexer: ipython3
  nbconvert_exporter: python
---

# a hidden notebook

+++

this is a hidden notebook with a code cell that has label `the-hidden-reference`

it is referred to from notebook on x-refs

```{code-cell} ipython3
#| label: the-hidden-reference

# The comment above has special syntax and sets cell metadata.
# This allows us to embed the output in other places.
print("Hello world! from the-hidden-reference")
```
