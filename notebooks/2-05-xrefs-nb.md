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

+++ {"slideshow": {"slide_type": ""}, "tags": []}

# x-refs 

playing with labeled cells, embed, figure ...

trying with cells that produce:

- a 2d plot
- a pandas df
- a folium map

+++

## matplotlib output

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt
```

+++ {"jp-MarkdownHeadingCollapsed": true}

### the source cell

we put a label `the-labeled-plot` on the following code cell

```{code-cell} ipython3
#| label: the-labeled-plot

X = np.linspace(0, 2*np.pi)
Y = np.sin(X)

plt.figure()
plt.plot(X, Y);
```

### referencing `the-labeled-plot`

+++

---

+++

#### WITHOUT -- the exclamation mark

we write this 
`[some visible text](#the-labeled-plot)` 
 [some visible text](#the-labeled-plot)

+++

---

+++

#### WITH --  an exclamation mark
we write this 
`![](#the-labeled-plot)` (text in brackets doesn't seem to be used)
 ![](#the-labeled-plot)

+++

---

+++

#### EMBED instead

now we use an `embed` directive - with a sharp `#` in front of the label

```{embed} #the-labeled-plot
```

+++

---

+++

#### FIGURE instead

now we use an `figure` directive - same thing, with a sharp `#` in front of the label

```{figure} #the-labeled-plot
some figure text goes here
```

+++

---
---

+++

## pandas df

```{code-cell} ipython3
import seaborn as sns
```

```{code-cell} ipython3
#| label: the-labeled-map

titanic = sns.load_dataset("titanic")
titanic.head(2)
```

hover on [this text to view the dataframe](#the-labeled-map)

+++

## folium output

```{code-cell} ipython3
import folium
```

### the source cell

we put a label `the-labeled-map` on the following code cell

```{code-cell} ipython3
---
slideshow:
  slide_type: ''
tags: []
---
#| label: the-labeled-map

CENTER = 48.856542, 2.347614

# prune-cell

# on purpose a little smaller so we can more easily scroll 
def paris_map():
    return folium.Map(
        location=CENTER,
        zoom_start=13,
        # width='80%',
    )

paris_map()
```

### referencing the map

[this should show a map ?](#the-labeled-map)

+++

## referencing a hidden notebook



[Hover me to refer to the cell labeled `the-hidden-reference`](#the-hidden-reference)
