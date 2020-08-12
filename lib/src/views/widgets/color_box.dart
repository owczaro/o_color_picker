import 'package:flutter/material.dart';

import 'color_box/decoration.dart';

/// A gesture sensitive widget with customizable:
/// * background
/// * border
/// * size
/// * content
/// * onTap callback
class OColorBox extends StatelessWidget {
  /// Decoration of the widget
  final OColorBoxDecoration decoration;

  /// Size of the widget
  final Size size;

  /// Content of the widget
  final Widget child;

  /// onTap callback
  final VoidCallback onPressed;

  /// Creates an instance of [OColorBox]
  const OColorBox({
    Key key,
    this.decoration,
    this.size,
    this.onPressed,
    this.child,
  })  : assert(decoration != null),
        assert(size != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: decoration.getBoxDecoration(context),
          child: child ?? SizedBox(width: 0.0, height: 0.0),
        ),
      );
}
