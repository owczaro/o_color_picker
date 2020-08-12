import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Border of [OColorBox]
class OColorBoxBorder extends Equatable {
  /// Border color
  final Color color;

  /// Border width
  final double width;

  /// Border radius
  final double radius;

  /// Creates an instance of [OColorBoxBorder]
  const OColorBoxBorder({
    this.color,
    this.width = 2.0,
    this.radius = 100.0,
  });

  /// Retrieves [Border] depends on border color
  Border get border => color == null
      ? null
      : Border.all(
          color: color,
          width: width,
        );

  /// Retrieves [BorderRadius] depends on border color
  BorderRadius get borderRadius =>
      color == null ? null : BorderRadius.circular(radius);

  @override
  List<Object> get props => [color, width, radius];
}
