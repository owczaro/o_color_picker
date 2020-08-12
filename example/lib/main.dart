import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';

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
            FlatButton(
              color: selectedColor,
              textColor: Colors.black,
              child: Text('Change the color of the button'),
              onPressed: () => showDialog<void>(
                context: context,
                builder: (_) => Material(
                  child: OColorPicker(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
