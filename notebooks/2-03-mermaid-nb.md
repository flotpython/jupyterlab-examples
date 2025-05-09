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

# mermaid

+++

un graphe simplissime

```{mermaid}
graph LR
  a --> b
```

+++

un graph a little more complex

```{mermaid}
gitGraph
   commit
   commit
   branch develop
   checkout develop
   commit
   commit
   checkout main
   merge develop
   commit
   commit
```

+++

## a plausible git scenario

`git commit`

```{mermaid}
gitGraph
    commit id: "A" type: HIGHLIGHT
```

+++

`git commit`

```{mermaid}
gitGraph
    commit id: "A"
    commit id: "B" type: HIGHLIGHT
```

+++

`git commit`

```{mermaid}
gitGraph
    commit id: "A"
    commit id: "B"
    commit id: "C" type: HIGHLIGHT
```

+++

`git switch -c devel A`

```{mermaid}
gitGraph
    commit id: "A" type: HIGHLIGHT
    branch devel
    checkout main
    commit id: "B"
    commit id: "C"
    checkout devel
```

```{note}
`git switch -c devel A` is a shortcut for

* `git branch devel A` (create branch `devel` at commit `A`)
* `git switch devel`   (teleport to branch `devel`)
```

+++

`git commit`

```{mermaid}
gitGraph
    commit id: "A"
    branch devel
    checkout main
    commit id: "B"
    commit id: "C"
    checkout devel
    commit id: "D" type: HIGHLIGHT
```

+++

`git commit`

```{mermaid}
gitGraph
    commit id: "A"
    branch devel
    checkout main
    commit id: "B"
    commit id: "C"
    checkout devel
    commit id: "D"
    commit id: "E" type: HIGHLIGHT
```

+++

`git merge main`

```{mermaid}
gitGraph
    commit id: "A"
    branch devel
    checkout main
    commit id: "B"
    commit id: "C"
    checkout devel
    commit id: "D"
    commit id: "E"
    merge main id: "F" type: HIGHLIGHT
```

+++

`git switch main`

```{mermaid}
gitGraph
    commit id: "A"
    branch devel
    checkout main
    commit id: "B"
    commit id: "C" type: HIGHLIGHT
    checkout devel
    commit id: "D"
    commit id: "E"
    merge main id: "F"
    checkout main
```

+++

`git merge devel main`

```{mermaid}
gitGraph
    commit id: "A"
    branch devel
    checkout main
    commit id: "B"
    commit id: "C"
    checkout devel
    commit id: "D"
    commit id: "E"
    checkout main
    merge devel id: "F" type: HIGHLIGHT
```
