import 'package:flutter/material.dart';
import 'package:food_app/models/theme_model.dart';
///
///
///Dark Mode Provider
///
///Dark mode ve Light mode değişikliğini bildirir 
///
///
///
class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  ThemeProvider() {
    AppTheme.setLightTheme();
  }

//Switche bağlı olan isDarkMode değerine bakarak
//true ise setDarkTheme 
//false ise setLightTheme fonksiyonunu çağırıyor

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    isDarkMode ? AppTheme.setDarkTheme() : AppTheme.setLightTheme();
    notifyListeners();//üstteki fonksiyonlardan gelen değer ile her yerdeki değişkenleri değiştiriyor
  }
}
