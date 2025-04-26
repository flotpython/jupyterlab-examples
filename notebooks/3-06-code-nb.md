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

# code

we're tweaking `style_jb2.css` to render these a little more nicely

+++

## cells

```{code-cell} ipython3
# this is a code cell
print('hello world')
modulus = 3 * 107 * 2**30 + 1
modulus
```

and one with some plots; note that there no longer is a need to add a final `;`
as myst takes care of that for us; it does trigger some sort of warning though

```{code-cell} ipython3
import matplotlib.pyplot as plt
import numpy as np

plt.title('Sine wave')
x = np.linspace(0, 2 * np.pi, 100)
y = np.sin(x)
plt.plot(x, y)
```

## code blocks

we can have `inline code` in the text that go on, or

```python
# code blocks in Python
print('hello world')
```

```javascript
// code blocks in JavaScript
console.log('hello world')
```

```bash
# code blocks in bash
echo hello world
```

```html
<!-- code blocks in HTML -->
<!DOCTYPE html>
<html>
  <head>
    <title>hello world</title>
  </head>
  <body>
    <h1>hello world</h1>
  </body>
</html>
```

```css
/* code blocks in CSS */
body {
  background-color: lightblue;
}
```

and so on and so forth
