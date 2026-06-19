---
jupytext:
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

# nested cells

## use case

it's sometimes useful to create a code-cell that is not a first-level object in
the flat data model that jupyter lab would consider

for example, you want to create an executable cell **within an admonition**; your
first attempt would be

````markdow

::::{admonition} I have an included executable cell

some text before

```{code-cell} python
print("I am inside the admonition)
```

some text after
::::
````

## kind of works

which indeed would work in MyST (as in: the cell is executed):

::::{admonition} I have an included executable cell

some text before

```{code-cell} python
print("I am inside the admonition")
```

some text after
::::

**BUT** if you try to open this in JupyterLab, then this time the cell is ***not
executed***

```{admonition} but why ? 

remember jupyter considers a notebook a **flat** collection of
cells that can be code or markdown, and in this form your code is just "hidden"
within the markdown cell and it won't get executed.
```

## the workaround

https://mystmd.org/guide/exercises#directive-solution suggests a way to deal with this situation in the context of exercises

here we try to see if the same holds with, say `admonition` or `grid` directives

### admonition

:::{admonition-start} I have an included executable cell

some text before

:::

:::{code-cell} ipython
print("I am inside the admonition")
:::

::::{admonition-end}

some text after

:::
