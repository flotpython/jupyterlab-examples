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

:::{manim}
// manim-web scene — write async code using the scene object
// Available: Scene, Player, Circle, Square, Triangle, Line, Dot, Arrow,
// Text, MathTex, VGroup, NumberPlane, Axes, ValueTracker, Angle, Brace,
// Create, FadeIn, FadeOut, Transform, Write, GrowFromCenter, Shift, Rotate,
// MoveAlongPath, Rotating, Indicate, AnimationGroup, LaggedStart, Broadcast,
// BLUE, RED, GREEN, YELLOW, WHITE, BLACK, ORANGE, PURPLE, UP, DOWN, LEFT, RIGHT, ORIGIN

// const scene = new Scene(container, {
//   width: 600,
//   height: 400,
//   backgroundColor: '#0d1117',
// });

// Draw a blue circle, transform it into a red square, then fade out
const circle = new Circle({ radius: 1.5, color: BLUE });
await scene.play(new Create(circle));
await scene.wait(0.5);

const square = new Square({ sideLength: 3, color: RED });
await scene.play(new Transform(circle, square));
await scene.wait(0.5);

const triangle = new Triangle({ color: GREEN });
triangle.scale(2);
await scene.play(new Transform(circle, triangle));
await scene.wait(0.3);

await scene.play(new Rotate(circle, { angle: Math.PI }));
await scene.play(new FadeOut(circle));

const tex = new MathTex({ latex: 'e^{i\\pi} + 1 = 0', color: '#ffffff', fontSize: 2.5 });
await tex.waitForRender();
await scene.play(new FadeIn(tex));
await scene.wait(1.5);
:::
