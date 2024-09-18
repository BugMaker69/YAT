import 'package:flutter/material.dart';
import 'package:flutter_project/themes/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;
  ThemeData get currentTheme => isDarkMode ? darkMode : ligthMdoe;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
