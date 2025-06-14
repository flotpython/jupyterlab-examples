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

# folium (and embeds)

+++

## matplotlib output

+++

### the source cell

we put a label `the-labeled-plot` on the following code cell

```{code-cell} ipython3
#| label: the-labeled-plot

import numpy as np
import matplotlib.pyplot as plt

X = np.linspace(0, 2*np.pi)
Y = np.sin(X)

plt.figure()
plt.plot(X, Y);
```

### referencing `the-labeled-plot`

- with a `![](#label)` ![](#the-labeled-plot)
- same without the ! [](#the-labeled-plot)
- with an `embed`directive
  ```{embed} #the-labeled-plot
  ```

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

### the embedded result with an `{embed}` directive

once this is done we can show the cell output 
```{embed} #the-labeled-map
```

+++

### same but with a `![]()`

![alternative text](#the-labeled-map)
