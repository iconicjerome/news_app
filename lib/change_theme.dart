import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  bool _isDark = false;

  ThemeMode curentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
