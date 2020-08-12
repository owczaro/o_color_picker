import 'package:flutter/material.dart';
import '../../../o_color_picker.dart';
import '../../services/color_provider.dart';

/// Customizable color picker.
///
///
/// Typical usage is as follows:
///
/// ```dart
///  OColorPicker(
///    selectedColor: Colors.white,
///    colors: primaryColorsPalette,
///    onColorChange: (color) => null,
///  );
/// ```
class OColorPicker extends StatefulWidget {
  /// Currently selected color of given part of an app - e.g. app's background.
  final Color selectedColor;

  /// Main palette of colors.
  /// By default you can use [primaryColorsPalette] or [accentColorsPalette]
  final List<ColorSwatch> colors;

  /// Excluded colors from main palette. It might be helpful
  /// when user can choose colors of widgets which are close to each other
  /// and you don't want to blend them by same color.
  /// E.g. if user choose black as app's background and black as buttons colors,
  /// buttons may go missing in the background.
  final List<Color> excludedColors;

  ///  On color change callback.
  ///  E.g. save somewhere selected color and pop Navigator.
  final ValueChanged<Color> onColorChange;

  /// Space between tiles of color picker.
  final double spacing;

  /// Size of tiles of color picker (height and width are equal).
  final Size boxSize;

  /// Border of tiles of color picker.
  final OColorBoxBorder boxBorder;

  /// Creates an instance of [OColorPicker]
  const OColorPicker({
    Key key,
    this.colors,
    @required this.selectedColor,
    @required this.onColorChange,
    this.excludedColors = const [],
    this.spacing = 9.0,
    this.boxSize = const Size(40.0, 40.0),
    this.boxBorder,
  }) : super(key: key);

  @override
  _OColorPickerState createState() => _OColorPickerState();
}

class _OColorPickerState extends State<OColorPicker> {
  List<Color> currentPalette;
  ColorSwatch primaryColorOfSelectedColor;
  bool isMainScreen;

  @override
  void initState() {
    super.initState();
    _initSelectedValue();
  }

  void _initSelectedValue() => setState(() {
        currentPalette = OColorProvider.getPrimaryColors(
          colors: widget.colors,
          excludedShades: widget.excludedColors,
        );
        primaryColorOfSelectedColor = OColorProvider.getPrimaryFromShade(
          primaryColors: currentPalette,
          shade: widget.selectedColor,
        );
        isMainScreen = true;
      });

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: _onKeyboardBackButton,
        child: Wrap(
          spacing: widget.spacing,
          runSpacing: widget.spacing,
          children: _screen(),
        ),
      );

  Future<bool> _onKeyboardBackButton() async {
    if (isMainScreen) {
      return true;
    }
    _onBack();
    return false;
  }

  List<Widget> _screen() => <Widget>[
        if (!isMainScreen) ...{
          _backIcon(),
        },
        ..._getColoredBoxes(),
      ];

  IconButton _backIcon() => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: _onBack,
        padding: EdgeInsets.only(right: 2.0),
      );

  void _onBack() => _initSelectedValue();

  List<Widget> _getColoredBoxes() => <Widget>[
        for (var color in currentPalette) ...{
          OColorBox(
            decoration: OColorBoxDecoration(
              color: color,
              border: widget.boxBorder,
            ),
            size: widget.boxSize,
            onPressed: () => isMainScreen
                ? _onPrimaryColorSelected(color)
                : _onShadeColorSelected(color),
            child: _icon(color),
          ),
        }
      ];

  Icon _icon(Color color) => (isMainScreen
          ? primaryColorOfSelectedColor?.value == color.value
          : widget.selectedColor.value == color.value)
      ? Icon(
          Icons.check,
          color: _iconColor(color),
        )
      : null;

  Color _iconColor(Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light
          ? Colors.black
          : Colors.white;

  void _onPrimaryColorSelected(ColorSwatch color) {
    var _shadeColors = OColorProvider.getColorShades(
      color: color,
      excludedShades: widget.excludedColors,
    );

    if (_shadeColors?.length == 1) {
      _onShadeColorSelected(_shadeColors.first);
      return null;
    }

    setState(() {
      currentPalette = _shadeColors;
      isMainScreen = false;
    });
  }

  void _onShadeColorSelected(Color color) => widget?.onColorChange(color);
}
