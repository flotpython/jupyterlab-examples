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
  nbconvert_exporter: python
  pygments_lexer: ipython3
---

# cards and tabs

+++

from <https://mystmd.org/guide/dropdowns-cards-and-tabs>

+++

(label-grid-of-cards)=



## grid of cards

### texts, from the doc

primarily to check that it works under jb1 too - **note** that the headers don't make it to jb1's output

`````{myst}
````{grid} 1 1 2 3

```{card}
:header: Text content ✏️
Structure books with text files and Jupyter Notebooks with minimal configuration.
```

```{card}
:header: MyST Markdown ✨
Write MyST Markdown to create enriched documents with publication-quality features.
```

```{card}
:header: Executable content 🔁
Execute notebook cells, store results, and insert outputs across pages.
```
````
`````

+++

### 2 images, no size specified

``````{myst}
`````{grid} 1 1 2 2

````{card}
:header: Image content twice
```{image} media/board-8x8.png
```
````
````{card}
:header: Image content twice
```{image} media/board-8x8.png
```
````

`````
``````

+++

### 3 images, with sizes

`````{grid} 1 1 2 3

````{card}
:header: Image content twice
```{image} media/board-8x8.png
:width: 400px
```
````
````{card}
:header: Image content twice
```{image} media/board-8x8.png
:width: 400px
```
````
````{card}
:header: Image content twice
```{image} media/board-8x8.png
:width: 400px
```
````

`````

+++

## tabs

### almost as-is from the doc

``````{myst}
`````{tab-set}
````{tab-item} Tab 1
:sync: tab1
Tab one
```{image} media/board-8x8.png
:width: 200px
:align: center
```
````
````{tab-item} Tab 2
:sync: tab2
Tab two
````
`````
``````

+++

### going deeper

a sketch of our install doc (but was done in astro eventually)

``````{tab-set}
`````{tab-item} Windows

```{image} media/windows.png
:width: 80px
```

````{admonition} prep
:class: seealso

````

````{admonition} download
:class: dropdown

the text
````

````{admonition} install
:class: dropdown

the text
````
`````


`````{tab-item} MacOS
```{image} media/apple.png
:width: 80px
```
````{admonition} download
:class: dropdown

the text
````
````{admonition} install
:class: dropdown

the text
````
`````


`````{tab-item} Linux
```{image} media/linux.png
:width: 80px
```
````{admonition} download
:class: dropdown

the text
````
````{admonition} install
:class: dropdown

the text
````
`````
``````

+++

### synced tabs

synchronized selection:
each `tab-item` has a `:sync:` option, and items with the same value will be synchronized

``````{tab-set}
`````{tab-item} Windows
:sync: windows

replica1

```{image} media/windows.png
:width: 80px
```
`````


`````{tab-item} MacOS
:sync: macos

replica1

```{image} media/apple.png
:width: 80px
```
`````


`````{tab-item} Linux
:sync: linux

replica1

```{image} media/linux.png
:width: 80px
```
`````
``````

``````{tab-set}
`````{tab-item} Windows
:sync: windows

replica2

```{image} media/windows.png
:width: 80px
```
`````


`````{tab-item} MacOS
:sync: macos

replica2

```{image} media/apple.png
:width: 80px
```
`````


`````{tab-item} Linux
:sync: linux

replica2

```{image} media/linux.png
:width: 80px
```
`````
``````
