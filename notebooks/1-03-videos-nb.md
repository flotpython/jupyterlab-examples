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

# videos

+++

(label-video-iframe)=

## youtube: use IPython IFrame()

```{code-cell} ipython3
from IPython.display import IFrame

# Youtube
IFrame(
    "https://www.youtube.com/embed/i_ZcP7iNw-U?rel=0&amp;controls=0",
    width="600",
    height="400",
    # extras='frameborder="0" allowfullscreen',
)
```

## ditto with `remove-input`

the same with the input area hidden with 

- the `jupyterlab-hidecell` extension
- using the `remove-input` cell tag

```{code-cell} ipython3
:tags: [remove-input]

from IPython.display import IFrame

# Youtube
IFrame(
    "https://www.youtube.com/embed/i_ZcP7iNw-U?rel=0&amp;controls=0",
    width="600",
    height="400",
    # extras='frameborder="0" allowfullscreen',
)
```

+++

## using mystmd's directives

### remote with `iframe`

using the `iframe` myst directive

````{myst}
```{iframe} https://www.youtube.com/embed/i_ZcP7iNw-U?rel=0&amp;controls=0

works in both jlab and jb2
```
````

+++

### local with `figure` - under media/

using the `figure` myst directive

```{figure} media/under-media.mp4
:width: 200px
:height: 200px
this works in mystmd/jb2 (only in autoplay), but not in jlab
```

+++

### local with `figure` - under `_static`

using the `figure` myst directive again

```{figure} _static/under-static.mp4
:width: 200px
:height: 200px
this works in mystmd/jb2 (only in autoplay), but not in jlab
```

+++

## using ipywidgets's Video() is broken

````{admonition} for the record only
:class: danger

this is no longer working with MystMD, b/c of ipywidgets limitations !
````

```{code-cell} ipython3
# same as above, you can use `remove-input` to hide the code

from ipywidgets import Video
Video.from_file("_static/under-static.mp4", autoplay=False, width='800px')
```
