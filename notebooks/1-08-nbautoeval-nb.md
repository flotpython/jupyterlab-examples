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

# nbautoeval

+++

## not working in a static site

here is a first, static, test; there is also another, [better way with a dynamic interface thanks to jupyterlite](label-nbautoeval-dynamic)

```{code-cell} ipython3
# spot exercises
import sys, os
cwd = os.getcwd()
modules = cwd.replace('notebooks', 'modules')
sys.path.append(modules)
```

```{code-cell} ipython3
from corrections.exo_pgcd import exo_pgcd

exo_pgcd.example()
```

```{code-cell} ipython3
def pgcd(a, b):
    return b % a
```

```{code-cell} ipython3
exo_pgcd.correction(pgcd)
```
