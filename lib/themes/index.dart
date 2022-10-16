import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecommerce/entity/index.dart';

class ThemeDefault extends ChangeNotifier {
  static ThemeDefault theme = ThemeDefault();

  ThemeType themeType = ThemeType.poke;
  Color primaryColor =  Color.fromARGB(255, 53, 98, 173);
  Color secondaryColor =  Color.fromARGB(255, 255, 203, 8);
  Color tertiaryColor =  Color.fromARGB(255, 53, 98, 173);
  Color backgroundThemeColor =  Color.fromARGB(255, 235, 235, 235);
  ///////////////////////////////////////////////////////////////////
  Color colorText =  Color.fromARGB(255, 0, 0, 0);
  Color colorError =  Color.fromARGB(255, 204, 14, 14);
  Color colorSuccess =  Color.fromARGB(255, 5, 136, 49);
  Color colorWarning =  Color.fromARGB(255, 223, 123, 8);
  Color colorInfo =  Color.fromARGB(255, 78, 115, 236);

  List<PokeType> pokeTypesColors = [
    PokeType(
        type: 'bug',
        color: Color.fromARGB(255, 114, 159, 63),
        textColor: TextColor.white),
    PokeType(
        type: "normal",
        color: const Color.fromARGB(255, 164, 172, 175),
        textColor: TextColor.black),
    PokeType(
        type: "fighting",
        color: const Color.fromARGB(255, 213, 103, 35),
        textColor: TextColor.white),
    PokeType(
        type: "flying",
        color: const Color.fromARGB(255, 61, 199, 239),
        textColor: TextColor.black),
    PokeType(
        type: "flying-2",
        color: const Color.fromARGB(255, 189, 185, 184),
        textColor: TextColor.black),
    PokeType(
        type: "poison",
        color: const Color.fromARGB(255, 185, 127, 201),
        textColor: TextColor.white),
    PokeType(
        type: "ground",
        color: const Color.fromARGB(255, 247, 222, 63),
        textColor: TextColor.black),
    PokeType(
        type: "ground-2",
        color: const Color.fromARGB(255, 171, 152, 66),
        textColor: TextColor.black),
    PokeType(
        type: "rock",
        color: const Color.fromARGB(255, 163, 140, 33),
        textColor: TextColor.white),
    PokeType(
        type: "ghost",
        color: const Color.fromARGB(255, 123, 98, 163),
        textColor: TextColor.white),
    PokeType(
        type: "steel",
        color: const Color.fromARGB(255, 158, 183, 184),
        textColor: TextColor.black),
    PokeType(
        type: "fire",
        color: const Color.fromARGB(255, 253, 125, 36),
        textColor: TextColor.white),
    PokeType(
        type: "water",
        color: const Color.fromARGB(255, 69, 146, 196),
        textColor: TextColor.white),
    PokeType(
        type: "grass",
        color: const Color.fromARGB(255, 155, 204, 80),
        textColor: TextColor.black),
    PokeType(
        type: "electric",
        color: const Color.fromARGB(255, 238, 213, 53),
        textColor: TextColor.black),
    PokeType(
        type: "psychic",
        color: const Color.fromARGB(255, 243, 102, 185),
        textColor: TextColor.white),
    PokeType(
        type: "ice",
        color: const Color.fromARGB(255, 81, 196, 231),
        textColor: TextColor.black),
    PokeType(
        type: "dragon",
        color: const Color.fromARGB(255, 83, 164, 207),
        textColor: TextColor.white),
    PokeType(
        type: "dragon-2",
        color: const Color.fromARGB(255, 241, 110, 87),
        textColor: TextColor.white),
    PokeType(
        type: "dark",
        color: const Color.fromARGB(255, 112, 112, 112),
        textColor: TextColor.white),
    PokeType(
        type: "fairy",
        color: const Color.fromARGB(255, 253, 185, 233),
        textColor: TextColor.black),
    PokeType(
        type: "unknown",
        color: const Color.fromARGB(255, 0, 0, 0),
        textColor: TextColor.white),
    PokeType(
        type: "shadow",
        color: const Color.fromARGB(255, 0, 0, 0),
        textColor: TextColor.white)
  ];

  alterTheme(ThemeType tT) {
    themeType = tT;
    switch (tT) {
      case ThemeType.pokeBall:
        primaryColor = Color.fromARGB(255, 237, 28, 36);
        secondaryColor = Color.fromARGB(255, 255, 255, 255);
        backgroundThemeColor = Color.fromARGB(255, 235, 235, 235);
        colorText =  Color.fromARGB(255, 0, 0, 0);
        break;
      case ThemeType.ultraBall:
        primaryColor = Color.fromARGB(255, 254, 215, 34);
        secondaryColor = Color.fromARGB(255, 55, 52, 53);
        backgroundThemeColor = Color.fromARGB(255, 55, 52, 53);
        colorText = Color.fromARGB(255, 235, 235, 235);
        break;
      default:
        primaryColor = Color.fromARGB(255, 53, 98, 173);
        secondaryColor = Color.fromARGB(255, 255, 203, 8);
        backgroundThemeColor = Color.fromARGB(255, 235, 235, 235);
        colorText =  Color.fromARGB(255, 0, 0, 0);
        break;
    }

    notifyListeners();
  }
}

enum ThemeType { poke, ultraBall, pokeBall }
