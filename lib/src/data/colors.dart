import 'package:flutter/material.dart';

/// Primary colors. From those the color picker can generate shades.
/// You can use [primaryColorsPalette] as `color` parameter in [OColorPicker]
const List<MaterialColor> primaryColorsPalette = <MaterialColor>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  MaterialColor(
    0xFF000000,
    <int, Color>{
      100: Color(0xFF969696),
      500: Color(0xFF363636),
      900: Color(0xFF000000),
    },
  ),
  MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      500: Color(0xFFe5e5e5),
      900: Color(0xFFa0a0a0),
    },
  ),
];

/// Accent colors. From those the color picker can generate shades.
/// You can use [accentColorsPalette] as `color` parameter in [OColorPicker]
const List<MaterialAccentColor> accentColorsPalette = <MaterialAccentColor>[
  Colors.redAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.indigoAccent,
  Colors.blueAccent,
  Colors.lightBlueAccent,
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.greenAccent,
  Colors.lightGreenAccent,
  Colors.limeAccent,
  Colors.yellowAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
  MaterialAccentColor(
    0xFF000000,
    <int, Color>{
      100: Color(0xFF969696),
      500: Color(0xFF363636),
      900: Color(0xFF000000),
    },
  ),
  MaterialAccentColor(
    0xFFFFFFFF,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      500: Color(0xFFe5e5e5),
      900: Color(0xFFa0a0a0),
    },
  ),
];
