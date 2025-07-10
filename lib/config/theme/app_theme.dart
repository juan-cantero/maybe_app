import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

enum AppColorTheme { custom, blue, teal, yellow, deepOrange }

const Map<AppColorTheme, Color> _colorThemes = {
  AppColorTheme.custom: _customColor,
  AppColorTheme.blue: Colors.blue,
  AppColorTheme.teal: Colors.teal,
  AppColorTheme.yellow: Colors.yellow,
  AppColorTheme.deepOrange: Colors.deepOrangeAccent,
};

class AppTheme {
  final AppColorTheme selectedColor;
  AppTheme({this.selectedColor = AppColorTheme.custom});

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
