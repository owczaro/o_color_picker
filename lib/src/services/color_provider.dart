import 'package:flutter/material.dart';
import '../data/colors.dart';

/// Provides colors for both steps
/// and removes particular colors from provided ones.
class OColorProvider {
  /// Provides colors for 1st step
  static List<ColorSwatch>? getPrimaryColors({
    List<ColorSwatch>? colors = primaryColorsPalette,
    List<Color?> excludedShades = const [],
  }) {
    var _palette = List<ColorSwatch>.from(colors ?? []);
    _removeMainColorIfAllShadesAreExcluded(_palette, excludedShades);

    return _palette;
  }

  static void _removeMainColorIfAllShadesAreExcluded(
    List<ColorSwatch> _palette,
    List<Color?> excludedShades,
  ) {
    _palette.removeWhere((element) => getColorShades(
          color: element,
          excludedShades: excludedShades,
        )!
            .isEmpty);
  }

  /// Provides colors for 2nd step
  static List<Color>? getColorShades({
    ColorSwatch? color,
    List<Color?> excludedShades = const [],
  }) {
    if (color == null) {
      return <Color>[];
    }
    final generatedColorList =
        List<Color?>.generate(10, (i) => color[100 * i++]);

    var _shades = <Color?>[color[50], ...generatedColorList];
    _shades.removeWhere((element) => element.runtimeType != Color);

    return _removeColorsFromPalette(
      palette: _shades,
      colorsToRemove: excludedShades,
    );
  }

  static List<Color> _removeColorsFromPalette({
    required List<Color?> palette,
    required List<Color?> colorsToRemove,
  }) {
    var newPalette = List<Color>.from(palette);
    newPalette.removeWhere((color) => colorsToRemove.contains(color));

    return newPalette;
  }

  /// Searches main (from 1st step) color from which given shade has been made.
  static ColorSwatch? getPrimaryFromShade({
    List<ColorSwatch>? primaryColors,
    Color? shade,
  }) {
    if (primaryColors == null || shade == null) {
      return null;
    }

    for (var primaryColor in primaryColors) {
      if (_containsSelectedColor(primaryColor: primaryColor, shade: shade)) {
        return primaryColor;
      }
    }

    return null;
  }

  static bool _containsSelectedColor({
    required ColorSwatch primaryColor,
    Color? shade,
  }) =>
      getColorShades(
        color: primaryColor,
      )!
          .contains(shade);
}
