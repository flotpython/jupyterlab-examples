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

this one would work out fine if executed at build-time;  
however for itables we need to execute it at read-time...

so this notebook has `skip_execution: true` in the metadata; you need to execute it in the browser:

- click the "Run" button in the upper section (looks like a ON/OFF toggle
- then run the whole notebook (looks like a "play" button)

(label-pandas-df)=

```{code-cell} ipython3
# note that running under jlite, we could not read data/titanic.csv !

from string import ascii_uppercase as letters
import numpy as np
import pandas as pd

df = pd.DataFrame(np.random.randint(0, 1000, size=(100, len(letters))), columns=list(letters))
df
```

## same DataFrame with no scroll

with scrolled output (`:scrolled: true`) - does not change anything

```{code-cell} ipython3
:scrolled: true

df
```

## itables ?

(label-itables)=

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
