import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeDefault extends ChangeNotifier {
  static ThemeDefault theme = ThemeDefault();

  ThemeType themeType = ThemeType.poke;
  Color primaryColor = Color.fromARGB(255, 53, 98, 173);
  Color secondaryColor = Color.fromARGB(255, 255, 203, 8);
  Color tertiaryColor = Color.fromARGB(255, 53, 98, 173);
  Color backgroundThemeColor = Color.fromARGB(255, 235, 235, 235);
  ///////////////////////////////////////////////////////////////////
  Color colorText = Color.fromARGB(255, 29, 44, 95);
  Color colorError = Color.fromARGB(255, 204, 14, 14);
  Color colorSuccess = Color.fromARGB(255, 5, 136, 49);
  Color colorWarning = Color.fromARGB(255, 223, 123, 8);
  Color colorInfo = Color.fromARGB(255, 78, 115, 236);

  alterTheme(ThemeType tT) {
    themeType = tT;
    switch (tT) {
      case ThemeType.pokeBall:
        print('passei aqui');
        primaryColor = Color.fromARGB(255, 237, 28, 36);
        secondaryColor = Color.fromARGB(255, 255, 255, 255);
        backgroundThemeColor = Color.fromARGB(255, 235, 235, 235);
        break;
      case ThemeType.ultraBall:
        primaryColor = Color.fromARGB(255, 254, 215, 34);
        secondaryColor = Color.fromARGB(255, 55, 52, 53);
        backgroundThemeColor = Color.fromARGB(255, 55, 52, 53);
        break;
      default:
        primaryColor = Color.fromARGB(255, 53, 98, 173);
        secondaryColor = Color.fromARGB(255, 255, 203, 8);
        backgroundThemeColor = Color.fromARGB(255, 235, 235, 235);
        break;
    }

    notifyListeners();
  }
}

enum ThemeType { poke, ultraBall, pokeBall }
