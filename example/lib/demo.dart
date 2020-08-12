import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:o_popup/o_popup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'o_color_picker demo app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color selectedColor = Colors.lightGreen[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _sampleContainer(),
            SizedBox(height: 10.0),
            OPopupTrigger(
              barrierAnimationDuration: Duration(milliseconds: 400),
              triggerWidget: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.amber,
                child: Text('Change color'),
              ),
              popupContent: OColorPicker(
                selectedColor: selectedColor,
                colors: primaryColorsPalette,
                onColorChange: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _sampleContainer() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: selectedColor,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    );
  }
}
