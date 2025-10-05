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
---

(label-nbautoeval-dynamic)=

# nbautoeval in jlite !

+++

here is an attempt to embed a dynamic nbautoeval activity

this is not yet working, because

- for one, as code cells are not editable in jupyter book
- the corrections/ module cannot be found from the browser kernel

the following code could help in downloading & importing it, provided that we
could deposit the exercise code under e.g. `_static/exo_pgcd.py`  
but that's not something that is currently possible with myst I'm afraid

```{code-cell} ipython3
# this code seems OK, it computes the current window's location
# and messes with it to come up with the URL for e.g. an exercice .py code
# assuming it is stored in _static
# and assuming also that myst lets us expose the contents of _static

import js, asyncio, io, os

async def fetch_static_to_file(filename):
    # Try several JS expressions that *may* give the page URL
    page_url = None
    for expr in ("globalThis.location.href", "self.location.href", "location.href"):
        try:
            v = js.eval(expr)
            if v:
                page_url = str(v)
                break
        except Exception:
            continue

    if page_url:
        base = page_url.rsplit("/", 1)[0]
        url = f"{base}/_static/{filename}"
    else:
        # fallback to a relative path (often works because fetch resolves relative to the page)
        url = f"_static/{filename}"

    print("Fetching:", url)
    resp = await js.fetch(url)
    if not resp.ok:
        raise RuntimeError(f"fetch failed with status {resp.status} for {url}")
    text = await resp.text()
    # write to Pyodide virtual filesystem
    with open(filename, "w", encoding="utf-8") as f:
        f.write(str(text))

# Usage (in a cell that allows top-level await):
await fetch_static_to_file("exo_pgcd.py")
import exo_pgcd
# now use exo_pgcd
```

```{code-cell} ipython3
:tags: [remove-output]

# hopefully tmp
# need to gain control on the preloaded packages

%pip install nbautoeval
```

```{code-cell} ipython3
# exo_pgcd being under corrections/
from exo_pgcd import exo_pgcd

exo_pgcd.example()
```

```{code-cell} ipython3
# maybe some day one will be allowed to change the cell content
# before running it

def pgcd(a, b):
    return b % a
```

```{code-cell} ipython3
exo_pgcd.correction(pgcd)
```

*** 
leftovers
***

```{code-cell} ipython3
# trash me
# this is cell to introspect the js object and find where
# we find the 'location' information so we can build the URL
# where to fetch static stuff

import js

cands = ["window", "globalThis", "self", "location", "document"]
print("hasattr on js:", {c: hasattr(js, c) for c in cands})

for expr in (
    "globalThis.location.href",
    "self.location.href",
    "location.href",
    "document.location && document.location.href",
    "window && window.location.href",
):
    try:
        v = js.eval(expr)
        print(f"{expr} ->", v)
    except Exception as e:
        print(f"{expr} -> error: {type(e).__name__}: {e}")
```

```{code-cell} ipython3
# trash me

# this code allows to inspect the contents of a Python module
# it won't work with `js` though because it is of some special nature...

from IPython.display import HTML, JSON, Latex, Markdown

def clean(mod_dict):
    result = dict()
    for k, v in mod_dict.items():
        if isinstance(v, (int, float, str, bool, list, tuple)):
            result[k] = v
        elif isinstance(v, dict):
            result[k] = clean(v)
        else:
            result[k] = '--foreign--'
    return result

def inspect_module(mod):
    try:
        return JSON(clean(mod.__dict__))
    except:
        return JSON(clean(mod))
```
