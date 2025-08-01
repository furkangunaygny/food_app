import 'dart:ui';
import 'package:flutter/material.dart';

///
///
///AppTheme
///
///Uygulamadaki renkleri değişken olarak tutar
///
///Renk ataması yapan fonksiyonları tutar
///
///
///
class AppTheme {
  static late Color backColor;
  static late Color textColor;
  static late Color iconColor;
  static late Color explanationContainerColor;
  static late Color appColor;

  static void setLightTheme() {
    backColor = Colors.white;
    textColor = Colors.black;
    iconColor = Colors.black;
    explanationContainerColor = Colors.white;
    appColor = Colors.purple;
  }

  static void setDarkTheme() {
    backColor = Colors.black;
    textColor = Colors.white;
    iconColor = Colors.white;
    explanationContainerColor = Colors.black;
    appColor = Colors.purple;
  }
}
