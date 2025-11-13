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
skip_execution: true
---

# Pandas DataFrame

for this one it seems we're better off executing at build-time

```{code-cell} ipython3
from string import ascii_uppercase as letters

import numpy as np
import pandas as pd

df = pd.DataFrame(np.random.randint(0, 100, size=(100, len(letters))), columns=list(letters))
df
```

## same DataFrame with no scroll

with scrolled output (`:scrolled: true`) - does not change anything

```{code-cell} ipython3
:scrolled: true

df
```

## itables ?

```{code-cell} ipython3
%pip install itables
```

```{code-cell} ipython3
import itables
itables.init_notebook_mode()
```

```{code-cell} ipython3

df
```
