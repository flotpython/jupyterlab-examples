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

# bokeh (interactive)

like `altair` and `plotly`, `bokeh` embeds its data and JavaScript into the
output, so the interactivity runs **client-side** in the browser; the slider
below should keep working in the static jupyter book, with no live kernel attached

```{code-cell} ipython3
import numpy as np
from bokeh.io import output_notebook, show
from bokeh.layouts import column
from bokeh.models import ColumnDataSource, CustomJS, Slider
from bokeh.plotting import figure

# required so bokeh embeds its output inside the notebook (and the book)
output_notebook()
```

## a sine wave with a frequency slider

bokeh lets us attach a `CustomJS` callback to the slider — so unlike plotly we
don't pre-compute one curve per value: the `sin(f · x)` is recomputed in the
browser every time the slider moves, giving a smooth continuous control

```{code-cell} ipython3
X = np.linspace(0, 4 * np.pi, 400)
source = ColumnDataSource(data=dict(x=X, y=np.sin(2.0 * X)))

plot = figure(
    width=700, height=300,
    y_range=(-1.1, 1.1),
    title="drag the slider to change the frequency",
    x_axis_label="x", y_axis_label="sin(frequency · x)",
)
plot.line("x", "y", source=source)

frequency = Slider(start=0.5, end=10.0, value=2.0, step=0.1, title="frequency")

# this runs in the browser, no kernel needed
callback = CustomJS(
    args=dict(source=source, frequency=frequency),
    code="""
    const x = source.data.x;
    const y = source.data.y;
    const f = frequency.value;
    for (let i = 0; i < x.length; i++) {
        y[i] = Math.sin(f * x[i]);
    }
    source.change.emit();
    """,
)
frequency.js_on_change("value", callback)

show(column(frequency, plot))
```
