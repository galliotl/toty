import 'package:flutter/material.dart';
import 'package:toty/style/style.dart';

enum Themes {
  Dark,
  Light,
}

Map<Themes, ThemeData> themeDatas = {
  Themes.Light: lightTheme,
  Themes.Dark: darkTheme,
};

class ThemeNotifier with ChangeNotifier {
  ThemeData _currentThemeData = themeDatas[Themes.Light];
  get currentThemeData => _currentThemeData;
  set currentThemeData(Themes theme) {
    _currentThemeData = themeDatas[theme];
    notifyListeners();
  }

  Themes _appliedTheme = Themes.Light;
  get appliedTheme => _appliedTheme;
  set appliedTheme(Themes theme) {
    _appliedTheme = theme;
    notifyListeners();
  }

  /// Applies the required theme
  applyTheme(Themes theme) {
    appliedTheme = theme;
    currentThemeData = theme;
  }

  /// Switches the theme data
  switchDarkLight() {
    applyTheme(appliedTheme == Themes.Dark ? Themes.Light : Themes.Dark);
  }
}
