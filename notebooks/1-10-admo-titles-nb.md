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

# code in admonition title

it seems that not all markdown construction play well when put in an admonition title

each time we try the same admonition with backticks, and then with colons

+++

## code in the title

+++

::::{admonition} the title has `some code`

with colons instead of backticks - this works well in jlab, but not in jbook

::::

+++

***
***

+++

`````bash
the code below breaks it very hard, I keep for next time I want to try it, but for now it is too disruptive

````{admonition} the title has `some code`

and the admonition is made with backticks - not working in jlab, and not in jbook either

````
`````

+++

***
***

+++

## italics in the title

+++

::::{admonition} the title has *italics*

with colons instead of backticks - and same result: this works well in jlab, but not in jbook

::::

+++

***
***

+++

likewise

`````bash
````{admonition} the title has *italics*`

and the admonition is made with backticks - not working in jlab, and not in jbook either

````
`````
