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

## `{code-block}`

prefer to use the `code-block` directive  
more details here <https://mystmd.org/guide/code>

+++

# code blocks

+++

### `:linenos:`

+++

````{myst}
```{code-block}
:linenos:

one
two
three
four
five
six
seven
```
````

+++

### `:emphasize-lines:`

**must** use linenos too, otherwise it won't trigger

+++

````{myst}
```{code-block}
:linenos:
:emphasize-lines: 2, 4,5,6

one
two
three
four
five
six
seven
```
````

+++

### filename

+++

````{myst}
```{code-block}
:filename: my-numbers.txt

one
two
three
four
five
six
seven
```
````

+++

## `{literalinclude}`

to show stuff - possible an extract - from a local file
(not working in jlab)

+++

### plain inclusion of separate file in the repo

the `myst` directive does not work with `literalinclude`..

```{literalinclude} Makefile
```

+++

### partial

same between `style` (inclusive) and `wildcard` (exclusive), with these options
added to the `literalinclude` directive

```markdown
:start-at: style
:end-before: wildcard
```

this yields

```{literalinclude} Makefile
:start-at: style
:end-before: wildcard
```

```{list-table}
:header-rows: 1

* - option
  - how it works

* - `start-at`
  - inclusive

* - `start-after`
  - exclusive

* - `end-at`
  - inclusive

* - `end-before`
  - exclusive
```

+++

### the file name

with this option:

```markdown
:filename: my-fake-name
```

we get

```{literalinclude} Makefile
:filename: my-fake-name
```

+++

### emphasis lines

do not put spaces in the line list

```markdown
:linenos: true
:emphasize-lines: 2,4,6
```

```{literalinclude} Makefile
:linenos: true
:emphasize-lines: 2,4,6
```
