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
skip_execution: true
---

(label-ipywidgets)=

# ipywidgets

```{code-cell} ipython3
%pip install ipywidgets
```

## interact

```{code-cell} ipython3
from ipywidgets import interact, IntSlider
```

```{code-cell} ipython3
s = IntSlider(0, 10)
```

```{code-cell} ipython3
s
```

```{code-cell} ipython3
s.value
```

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt
```

```{code-cell} ipython3
def foo(freq):
    X = np.linspace(0, 2*np.pi)
    Y = np.sin(freq*X)
    plt.plot(X, Y)
    plt.show()
```

```{code-cell} ipython3
interact(foo, freq=s);
```

## 2 widgets in sync

miscell tricks around widgets, like e.g. keeping 2 widgets in sync (sharing the same value)

```{code-cell} ipython3
import ipywidgets

a = ipywidgets.FloatText()
b = ipywidgets.FloatSlider()
display(a,b)

mylink = ipywidgets.jslink((a, 'value'), (b, 'value'))
```
