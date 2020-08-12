import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_color_picker/o_color_picker.dart';

/// Tests [OColorBox]

void main() {
  group('[Views/Widgets] OColorBox', () {
    testWidgets('Test widget', (tester) async {
      final widgetSize = Size(33.3, 44.4);
      final widgetChild = Container(width: 1, height: 1, key: UniqueKey());
      var pressCount = 0;
      final widgetDecoration = OColorBoxDecoration(
        color: Colors.blue,
        border: OColorBoxBorder(
          color: Colors.red,
          width: 1.1,
          radius: 12.3,
        ),
      );
      await tester.pumpWidget(
        OColorBox(
          size: widgetSize,
          decoration: widgetDecoration,
          child: widgetChild,
          onPressed: () => pressCount++,
        ),
      );

      final colorBox = tester.widget(find.byType(OColorBox)) as OColorBox;

      expect(colorBox.size, equals(widgetSize));
      expect(colorBox.decoration, equals(widgetDecoration));
      expect(colorBox.child, equals(widgetChild));

      await tester.tap(find.byType(OColorBox));
      expect(pressCount, equals(1));
    });
  });
}
