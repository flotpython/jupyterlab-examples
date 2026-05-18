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

# remove-in/output

the tags `remove-input` - `remove-output` - `remove-cell` are effective ***on code cells only***  
the feature is activated through the code cell's `metadata.tags

using the `myst` directive did not pan out here...  
here's the textual input for the first cell below  
the other two have a similar content, but for the tag

````text
```{code-cell} ipython3
:tags: [remove-input]
print("with remove-input we show the output but not the code")
```
````

---

## setting the `remove-input` tag

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 1 remove-input code cell below

```{code-cell} ipython3
:tags: [remove-input]
print("with remove-input we show the output but not the code")
```

↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ hide-input cell above

---

## setting the `remove-output` tag

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 1 remove-output code cell below

```{code-cell} ipython3
:tags: [remove-output]
print("this time we see the code and not the output")
```

↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ remove-output cell above

---

## setting the `remove-cell` tag

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 1 remove-cell code cell below

```{code-cell} ipython3
:tags: [remove-cell]

# this time we see nothing
print("should show the code but not the output")
```

↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ remove-cell cell above
