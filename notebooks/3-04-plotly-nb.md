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

# plotly (interactive)

like `altair`, `plotly` embeds its data and a bit of JavaScript into the output,
so the interactivity runs **client-side** in the browser; the slider below should
keep working in the static jupyter book, with no live kernel attached

```{code-cell} ipython3
import numpy as np
import plotly.graph_objects as go
```

## a sine wave with a frequency slider

plotly's slider toggles the visibility of pre-computed traces — so we build one
`sin(f · x)` curve per frequency value, make them all invisible except the
default one, and let the slider switch between them in the browser

```{code-cell} ipython3
X = np.linspace(0, 4 * np.pi, 400)
frequencies = np.arange(0.5, 10.5, 0.5)
default = 3  # index of frequency 2.0 in the array above

fig = go.Figure()

# one (hidden) trace per frequency
for f in frequencies:
    fig.add_trace(
        go.Scatter(x=X, y=np.sin(f * X), visible=False, name=f"f = {f}")
    )

fig.data[default].visible = True

# one slider step per trace, toggling which one is visible
steps = [
    dict(
        method="update",
        args=[{"visible": [j == i for j in range(len(frequencies))]}],
        label=f"{f:g}",
    )
    for i, f in enumerate(frequencies)
]

fig.update_layout(
    title="drag the slider to change the frequency",
    sliders=[dict(active=default, currentvalue={"prefix": "frequency: "}, steps=steps)],
    yaxis=dict(range=[-1.1, 1.1], title="sin(frequency · x)"),
    xaxis=dict(title="x"),
    width=700,
    height=300,
)

fig
```
