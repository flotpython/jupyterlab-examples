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

# altair (interactive)

unlike `ipywidgets`, altair renders to a Vega-Lite spec whose interactivity runs
**client-side** in the browser; so the slider below should keep working in the
static jupyter book, with no live kernel attached

```{code-cell} ipython3
import numpy as np
import pandas as pd
import altair as alt
```

## a sine wave with a frequency slider

the trick is to do the actual `sin()` computation **in Vega**, via a
`transform_calculate` that reads a parameter bound to a slider — that way the
plot recomputes itself in the browser when you drag the slider

```{code-cell} ipython3
# the x axis is fixed; y is computed client-side from the slider value
X = np.linspace(0, 4 * np.pi, 400)
source = pd.DataFrame({"x": X})

frequency = alt.param(
    name="frequency",
    value=2.0,
    bind=alt.binding_range(min=0.5, max=10.0, step=0.5, name="frequency "),
)

chart = (
    alt.Chart(source)
    .transform_calculate(y="sin(frequency * datum.x)")
    .mark_line()
    .encode(
        x=alt.X("x:Q", title="x"),
        y=alt.Y("y:Q", title="sin(frequency · x)", scale=alt.Scale(domain=[-1, 1])),
    )
    .add_params(frequency)
    .properties(width=600, height=200, title="drag the slider to change the frequency")
)

chart
```
