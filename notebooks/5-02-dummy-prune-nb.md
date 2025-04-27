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

to operate the nbprune workflow

the topic is for you to write a graph parser

given a file that looks like this

```
s1 10 s2
s2 20 s1
s2 30 s3
s3 20 s4
```

your code should

- open and read the file
- and return a `dict` that looks like this

```python
{'s1': [('s2', 10)], 's2': [('s1', 20), ('s3', 30)], 's3': [('s4', 20)]}
```

+++

# a pruned TP

```{code-cell} ipython3
# your code here
def graphdict(filename):
    pass
```
