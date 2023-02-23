# flutter_animation_practice_3

#### Using multiple `AnimationController` with a single `Animation` object.

```dart
_xController = AnimationController(vsync: this, duration: const Duration(seconds: 20));
_yController = AnimationController(vsync: this, duration: const Duration(seconds: 30));
_zController = AnimationController(vsync: this, duration: const Duration(seconds: 40));

_animation = Tween(begin: 0, end: 2 * pi);
```
- Here we have 3 `AnimationController` and a single `Animation`.

- To utilise all the `AnimationController` with one `Animation`.
```dart
AnimatedBuilder(
  animation: Listenable.merge([_xController, _yController, _zController]),
  builder: (context, child) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(_animation.evaluate(_xController))
        ..rotateY(_animation.evaluate(_xController))
        ..rotateZ(_animation.evaluate(_xController)),
      child: WIDGET_TO_BE_ANIMATED()
    );
  },
)
```

- We use `Listenable.merge` to listen to all the controllers and rebuilt the widget.
- And we use `Animation.evaluate` to get `_animation` value corresponding to a particular controller.