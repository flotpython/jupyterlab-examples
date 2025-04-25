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
nbhosting:
  title: toplevel title A
---

# plain lists

we're tweaking `style_jb2.css` to render these a little more nicely

+++

## no bullet no nesting

* one
* two
* three

a paragraph

* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners

with jb2 it does not seem to change something if we add newlines between the items

* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners

* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners

* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners

+++

## admo

```{admonition} within an admo
1. now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
1. now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
1. now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
```

```{admonition} within an admo and an paragraph on top

the header

* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
* now for something a little more interesting with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
```

+++

## nested lists - level 2

a paragraph and a 2-level list

* a main item with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
  * a subitem
  * another subitem
* a main item with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
  * a subitem
  * another subitem

+++

## nested lists - level 2

a paragraph and a 3-level list

* a main item with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
  * a subitem
    * that has subitems
    * one any number
  * another subitem
    * that has subitems
    * one any number
* a main item with a longer text that wraps hopefully along the borders of the page so we can see the impact of a list where the pieces are not just oneliners
  * a subitem
    * that has subitems
    * one any number
  * another subitem
    * that has subitems
    * one any number

+++

License CC BY-NC-ND, Thierry Parmentelat
