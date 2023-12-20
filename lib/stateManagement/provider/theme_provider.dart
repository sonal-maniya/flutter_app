import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  setTheme(theme) {
    _themeMode = theme;
    notifyListeners();
  }
}

enum MyThemeType { light, dark, system }

class ThemeState extends StateNotifier<MyThemeType> {
  ThemeState() : super(MyThemeType.light);

  void setTheme(MyThemeType theme) {
    state = theme;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeState, MyThemeType>((ref) => ThemeState());
