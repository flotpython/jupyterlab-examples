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

# Pyodide kernel

![](https://raw.githubusercontent.com/pyodide/pyodide/master/docs/_static/img/pyodide-logo.png)

```{admonition} Only in jupyterlite
:class: warning

this notebook is not supposed to be executed at build-time (in a regular jupyter environment), 
but only in the browser in jupyterlite

any attempt to execute it in a regular jupyter environment will likely fail
```

```{code-cell} ipython3
try:
  import pyodide_kernel
except ImportError:
  print("This notebook is meant to be run in jupyterlite only !!!")
  print("make sure you run myst **without** the --execute flag !")
  print("Skipping execution of the rest of the notebook")
  raise
```

## kernel version

```{code-cell} ipython3
:tags: [raises-exception]

import pyodide_kernel

pyodide_kernel.__version__
```

## Display

```{code-cell} ipython3
from IPython.display import HTML, JSON, Latex, Markdown
```

### HTML

```{code-cell} ipython3
print("Before display")

s = "<h1>HTML Title</h1>"
display(HTML(s))

print("After display")
```

***

+++

### Markdown

```{code-cell} ipython3
Markdown(
    """
# Title

**in bold**

~~Strikthrough~~
"""
)
```

***

+++

### Latex

```{code-cell} ipython3
Latex(
    r"""\begin{eqnarray}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
\nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0
\end{eqnarray}"""
)
```

***

+++

## Matplotlib

Basic static plotting (temp patch)

```{code-cell} ipython3
:scrolled: true

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 1000)
plt.plot(x, np.sin(x))

plt.show()
```

***

+++

## Network requests and JSON

```{code-cell} ipython3
# %pip install js
```

```{code-cell} ipython3
:tags: [raises-exception]

import json

from js import fetch
```

```{code-cell} ipython3
:scrolled: true
:tags: [raises-exception]

res = await fetch("https://httpbin.org/get")
text = await res.text()
obj = json.loads(text)
JSON(obj)
```

## Sympy

```{code-cell} ipython3
%pip install sympy
```

```{code-cell} ipython3
from sympy import Integral, init_printing, sqrt, symbols

init_printing()

x = symbols("x")

Integral(sqrt(1 / x), x)
```
