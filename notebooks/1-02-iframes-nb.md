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

# iframes

+++

## the static files feature

as of 2026 june and myst 1.10, there is now a way to include static files in the mystmd output

so we're going to use a static resource called `folium.html` that sits in the
source repo in `_static/folium.html` and that is declared as a static file in
`myst.yml`:

```yaml
project:
  static_files:
    - _static
```

With this setting:

- I can now refer to the html file in the notebook with a URL like `/_static/folium.html`
- Note that the initial `/` is mandatory
- Also as far as I can tell, the resource is **availble in a *static build***
  (`myst build`) but not in a *dev build* (`myst start`)..

In the examples below we focus on rendering an iFrame, and we'll use this folium-generated content as the source

+++

## raw HTML iframe: suboptimal !

`````{admonition} do not use an HTML iframe tag
:class: error

- kind of works in mystmd (but ignores sizes)
- but not in jlab at all (sanitized most likely)  

````{myst}
<!-- DO NOT USE THIS -->
<iframe src="/_static/folium.html" width="200px" height="200px">
</iframe>
````
`````

+++

## use IPython's IFrame instead

If you happen to use a Python kernel, this alternative seems to be the only way
apparently to have control on both sizes; can't center it though ?

```{code-cell} ipython3
from IPython.display import IFrame

IFrame("/_static/folium.html", "200px", "200px")
```

+++

## mystmd iframe

likewise, no control on sizes in mystmd:
- cannot set height (print error message) 
- and width is accepted but not honored apparently...

````{myst}
```{iframe} /_static/folium.html
:width: 200px
:align: center
```
````
