import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_color_picker/o_color_picker.dart';

/// Tests [OColorBoxBorder]

void main() {
  group('[Views/Widgets/ColorBox] OColorBoxBorder get border', () {
    test('Returns null, when no color', () {
      final boxBorder = OColorBoxBorder();
      expect(boxBorder.border, isNull);
    });

    test('Returns proper Border instance, when color is set', () {
      final boxBorder = OColorBoxBorder(color: Colors.blue);
      expect(boxBorder.border, isA<Border>());
    });

    test('Returns proper border color, when color is set', () {
      final boxBorder = OColorBoxBorder(color: Colors.blue);
      expect(boxBorder.border.top.color, equals(Colors.blue));
      expect(boxBorder.border.right.color, equals(Colors.blue));
      expect(boxBorder.border.bottom.color, equals(Colors.blue));
      expect(boxBorder.border.left.color, equals(Colors.blue));
    });

    test('Returns proper border width by default (= 2)', () {
      final boxBorder = OColorBoxBorder(color: Colors.blue);
      expect(boxBorder.border.top.width, equals(2));
      expect(boxBorder.border.right.width, equals(2));
      expect(boxBorder.border.bottom.width, equals(2));
      expect(boxBorder.border.left.width, equals(2));
    });

    test('Returns proper border width (= 10)', () {
      final boxBorder = OColorBoxBorder(color: Colors.blue, width: 10.0);
      expect(boxBorder.border.top.width, equals(10));
      expect(boxBorder.border.right.width, equals(10));
      expect(boxBorder.border.bottom.width, equals(10));
      expect(boxBorder.border.left.width, equals(10));
    });
  });

  group('[Views/Widgets/ColorBox] OColorBoxBorder get borderRadius', () {
    test('Returns null, when no color', () {
      final boxBorder = OColorBoxBorder();
      expect(boxBorder.borderRadius, isNull);
    });

    test('Returns proper border radius by default (= 100)', () {
      final boxBorder = OColorBoxBorder(color: Colors.blue);
      expect(boxBorder.borderRadius, equals(BorderRadius.circular(100)));
    });

    test('Returns proper border radius by default (= 10)', () {
      final boxBorder = OColorBoxBorder(color: Colors.blue, radius: 10.0);
      expect(boxBorder.borderRadius, equals(BorderRadius.circular(10)));
    });
  });
}
