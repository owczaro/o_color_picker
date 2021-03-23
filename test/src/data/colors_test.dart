import 'package:flutter_test/flutter_test.dart';
import 'package:o_color_picker/o_color_picker.dart';

/// Tests [primaryColorsPalette] and [accentColorsPalette]

void main() {
  group('[Data] primaryColorsPalette', () {
    test('Length > 0', () {
      expect(primaryColorsPalette.length, greaterThan(0));
    });
  });

  group('[Data] accentColorsPalette', () {
    test('Length > 0', () {
      expect(accentColorsPalette.length, greaterThan(0));
    });
  });
}
