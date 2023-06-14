import 'package:admin_management/common/themes/theme.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentThemeData => _isDarkMode ? CustomTheme.darkThemeData : CustomTheme.lightThemeData;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
