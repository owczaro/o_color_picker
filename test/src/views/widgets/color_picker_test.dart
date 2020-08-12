import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_color_picker/o_color_picker.dart';

/// Tests [OColorPicker]

void main() {
  group('[Views/Widgets] OColorPicker', () {
    testWidgets('Test widget', (tester) async {
      var selectedColor = Colors.white;
      final colorPalette = [
        MaterialColor(
          0xFF000000,
          <int, Color>{
            100: Color(0xFF969696),
            500: Color(0xFF363636),
            900: Color(0xFF000000),
          },
        ),
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Builder(
              builder: (context) {
                return OColorPicker(
                  selectedColor: selectedColor,
                  colors: colorPalette,
                  onColorChange: (color) => selectedColor = color,
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(OColorBox).first);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(OColorBox).first);
      expect(selectedColor, equals(colorPalette.first.shade100));
    });
  });
}
