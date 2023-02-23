# flutter_animation_practice_2

A simple animation using Clipper, Curves an Chained Animation.

### Clippers
- Helps to give a custom shape to a widget. 
- It clips/removes the unwated paert of a widget.
- `ClipPath` widget is used to achieve this.
- In `ClipPath` we have to define a path which is to be kept.

- `ClipPath` needs a clipper object.
- To create a custom clipper we extend a class to `CustomClipper`.


```dart
class HalfCircle extends CustomClipper<Path> {

  /// Returns the path 
  @override
  Path getClip(Size size) {
    final path = Path();
    // moved to top left which is starting of the arc
    path.moveTo(size.width, 0);

    // set the other end of the of the arc
    Offset arcEnd = Offset(size.width, size.height);
    
    // creates a semi-circle with the given radius
    path.arcToPoint(
      arcEnd,
      clockwise: true,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
    );

    // return to the starting position to complete the path
    path.close();

    return path;
  }

  /// Tells if the clipper should be redrawn if there is any change in the parent
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
```

- Now we can pass the custom clipper object into a `ClipPath` widget.

```dart
ClipPath(
    clipper: const HalfCircle(),
    child: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
    ),
),
```
***

### Animation Curves

```dart
_animation = Tween<double>(begin: 0.0, end: -(pi / 2)).animate(CurvedAnimation(
    parent: _animationController,
    curve: Curves.decelerate,
));

_animationController.repeat();
```

***

- Using `SingleTickerProviderStateMixin`, we can only create one `AnimationController` Object.
- To create multiple  `AnimationController`s we neet to use `TickerProviderStateMixin`, leaving rest the same.

***

- We can chain on animation after another by listening to and animation for completion and then we can start our new animation

```dart
firstAnimation.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
    
    secondAnimation = Tween<double>(
        begin: SOME_VALUE,
        end: SOME_OTHER_VALUE,
    ).animate(CurvedAnimation(
        parent: secondAnimationController,
        curve: Curves.bounceOut,
    ));

    secondAnimationController
        ..reset()
        ..forward();
    }
});
``