---
---

# a manim sample

:::{manim}
const circle = new Circle({ color: RED, fillOpacity: 0.3 });
scene.add(circle);
await scene.play(new Create(circle));
await scene.wait(1);
await scene.play(new FadeOut(circle));
:::
