import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'border.dart';

/// Decoration of [OColorBox]
class OColorBoxDecoration extends Equatable {
  /// Background color
  final Color? color;

  /// Border settings
  final OColorBoxBorder? border;

  /// Creates an instance of [OColorBoxDecoration]
  const OColorBoxDecoration({this.color, this.border});

  /// Retrieves [BoxDecoration] depends on border color
  BoxDecoration getBoxDecoration(BuildContext context) => BoxDecoration(
        color: color ?? Theme.of(context).backgroundColor,
        border: border?.border,
        borderRadius: border?.borderRadius,
      );

  @override
  List<Object?> get props => [color, border];
}
