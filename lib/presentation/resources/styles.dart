import 'package:flutter/material.dart';

import 'colors.dart';

MaterialColor getThemeColor() {
  final Map<int, Color> colorMap = {
    50: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .1),
    100: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .2),
    200: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .3),
    300: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .4),
    400: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .5),
    500: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .6),
    600: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .7),
    700: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .8),
    800: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, .9),
    900: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, 1),
  };

  return MaterialColor(primaryColor.value, colorMap);
}
