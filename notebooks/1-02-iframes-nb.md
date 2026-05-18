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

## the static files issue

as of 2026 may, there is no provision to include static files in the mystmd output
- not implicit like `_static` in jb1/sphinx
- and not even explicit; one coud imagine something like a `static` definition in the frontmatter, but no

so most of the examples below are not working simply because we try to refer to local assets, but we can't...

so in order to focus on the matter at hand (how to render iframes) independently
of the static files issue, we'll use a remote url for the examples below

+++

## tl - dr

- remote URLs are OK
- for locally shipped htmls (e.g. folium-produced maps), as of 2025 march:
  - jlab is mostly OK
  - jb2: I can't find the URL to retrieve them - whether we put them in `_static` or in `media`...

+++

## raw HTML iframe: suboptimal !

`````{admonition} do not use an html iframe tag
:class: error

works in mystmd, but not in jlab at all apparently (sanitized most likely)  
note the width/height things are not taken into account in mystmd

````{myst}
<!-- DO NOT USE THIS -->
<iframe src="https://jupyterlab-examples.info-mines.paris" width="200px" height="200px">
</iframe>
````
`````

+++

## possible to use IPython's IFrame instead

```{code-cell} ipython3
from IPython.display import IFrame

IFrame("https://jupyterlab-examples.info-mines.paris", "200px", "200px")
```

````{admonition} with a local URL
:class: warning dropdown

```{code-cell} ipython3
from IPython.display import IFrame

IFrame("media/addresses-final.html", "200px", "200px")
```
````

+++

## mystmd iframe

cannot set height - and width either apparently...

````{myst}
```{iframe} https://jupyterlab-examples.info-mines.paris
:width: 200px
:height: 200px
:align: center
```
````

````{admonition} with a local URL
:class: warning dropdown

````{myst}
```{iframe} media/addresses-final.html
:width: 200px
:height: 200px
:align: center
```
````
