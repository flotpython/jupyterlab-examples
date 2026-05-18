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

# exercises

+++

see all options in <https://mystmd.org/guide/exercises>  

in particular there is a `hidden` attribute that may come in handy but I have not explored in depth yet

+++

## native MyST exercise

here's a sample

`````{myst}

````{exercise} the header
:label: exo-label

the question; the dropdown class works too if needed
```{code-block}
# of course one can insert code in the body
class Foo:
    pass
```
````
`````

+++

### native MyST solution

here's a sample solution for the above exercise; the error here seems to be an
artefact of using the `myst` directive, but the syntax is correct, and the
`exo-label`link would point back to the exercise

`````{myst}
````{solution} exo-label
:label: sol-label
:class: dropdown

the solution
```{code-block} python
:linenos: true
def fact(n):
    pass
```
````
`````

+++

````{warning}
the argument to the `solution` directive is the label of the exercise
````

+++

````{admonition} other syntax
:class: seealso

see also an alternative syntax based on `solution-start` / `solution-end` in  
<https://ebp-sphinx-exercise.readthedocs.io/en/latest/syntax.html#basic-syntax>
````

+++

## hidden exercise and solution

### none hidden

```{exercise} none hidden
:label: exo-none-hidden
the question in the `exo-none-hidden` exercise

it's a good idea to then mention [a link to the solution](#sol-none-hidden) in the question,
as otherwise it might be hard to find  
also note the solution can be in another notebook entirely, if that helps

```

```{solution} none hidden
:label: sol-none-hidden
the solution to the `exo-none-hidden` exercise
```

### hidden solution

```{exercise} hidden solution
:label: exo-hidden-solution

the question in the `exo-hidden-solution` exercise
```

```{solution} exo-hidden-solution
:label: sol-hidden-solution
:hidden: true

the solution to the `exo-hidden-solution` exercise
```

### hidden exercise

```{exercise} hidden exercise
:label: exo-hidden-exercise
:hidden: true

the question in the `exo-hidden-exercise` exercise
```

```{solution} exo-hidden-exercise
:label: sol-hidden-exercise
the solution to the `exo-hidden-exercise` exercise
```

### both hidden

```{exercise} both hidden
:label: exo-both-hidden
:hidden: true
the question in the `exo-both-hidden` exercise
```

```{solution} exo-both-hidden
:label: sol-both-hidden
:hidden: true
the solution to the `exo-both-hidden` exercise
```

+++

## before this feature

before that we have used an admonition with a `seealso` class

```{admonition} exercise: the topic
:class: seealso

the question blabla  
note that the whole business might come with a `:class: dropdown` thingy
```

I don't have a very stable way to present solutions, here's one suboptimal way to do it with a 
`:class: dropdown warning` directive

```{admonition} solution
:class: dropdown warning

the solution
````
