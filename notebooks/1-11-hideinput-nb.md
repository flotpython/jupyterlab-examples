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

# remove-in/output

these 2 tags (`remove-input` and `remove-output`) are effective ***on code cells only***

the feature is activated through the code cell's `metadata.tags` that contain `remove-input` or remove-output`

## textual input

here's the textual input for the first cell below

````text
```{code-cell} ipython3
:tags: [remove-input]
print("with remove-input we show the output but not the code")
```
````

## `remove-input`

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 1 remove-input code cell below

```{code-cell} ipython3
:tags: [remove-input]
print("with remove-input we show the output but not the code")
```

↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ hide-input cell above

## `remove-output`

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 1 remove-output code cell below

```{code-cell} ipython3
:tags: [remove-output]
print("this time we see the code and not the output")
```

↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ remove-output cell above

## `remove-cell`

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 1 remove-cell code cell below

```{code-cell} ipython3
:tags: [remove-cell]

# this time we see nothing
print("should show the code but not the output")
```

↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ remove-cell cell above

