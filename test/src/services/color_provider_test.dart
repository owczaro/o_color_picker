import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_color_picker/src/services/color_provider.dart';

/// Tests [OColorProvider]

void main() {
  final testColors = <MaterialColor>[
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  group('[Services] OColorProvider.getPrimaryColors', () {
    test('Default palette', () {
      final result = OColorProvider.getPrimaryColors(colors: null);
      expect(result, isList);
      expect(result, hasLength(0));
    });

    test('Without exclusion', () {
      final result = OColorProvider.getPrimaryColors(colors: testColors);
      expect(result?.length, equals(testColors.length));
    });

    test('With exclusion 1 of 10 shades of a color', () {
      final result = OColorProvider.getPrimaryColors(
        colors: testColors,
        excludedShades: [testColors.first[50]],
      );

      expect(result?.length, equals(testColors.length));
    });

    test('With exclusion 2 of 2 shades of a color', () {
      final result = OColorProvider.getPrimaryColors(
        colors: [
          MaterialColor(
            0xFF000000,
            <int, Color>{
              500: Color(0xFF363636),
              900: Color(0xFF000000),
            },
          ),
        ],
        excludedShades: [
          Color(0xFF363636),
          Color(0xFF000000),
        ],
      );

      expect(result?.length, equals(0));
    });
  });

  group('[Services] OColorProvider.getColorShades', () {
    test('Default palette', () {
      final result = OColorProvider.getColorShades(color: null);
      expect(result?.length, equals(0));
    });

    test('Without exclusion', () {
      final result = OColorProvider.getColorShades(color: testColors.first);
      expect(result?.length, equals(10));
    });

    test('With exclusion 1 of 10 shades of a color', () {
      final result = OColorProvider.getColorShades(
        color: testColors.first,
        excludedShades: [testColors.first[50]],
      );

      expect(result?.length, equals(9));
    });

    test('With exclusion 2 of 2 shades of a color', () {
      final result = OColorProvider.getColorShades(
        color: MaterialColor(
          0xFF000000,
          <int, Color>{
            500: Color(0xFF363636),
            900: Color(0xFF000000),
          },
        ),
        excludedShades: [
          Color(0xFF363636),
          Color(0xFF000000),
        ],
      );

      expect(result?.length, equals(0));
    });
  });

  group('[Services] OColorProvider.getPrimaryFromShade', () {
    test('primaryColors: null, shade: null', () {
      final result = OColorProvider.getPrimaryFromShade(
        primaryColors: null,
        shade: null,
      );
      expect(result, isNull);
    });

    test('Find first color of testColors by shade50', () {
      final result = OColorProvider.getPrimaryFromShade(
        primaryColors: testColors,
        shade: testColors.first.shade50,
      );
      expect(result, equals(testColors.first));
    });
  });
}
