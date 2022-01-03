import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static const purple = Color(0xFF5117AC);
  static const green = Color(0xFF20D0C4);
  static const dark = Color(0xFF03011E);
  static const grey = Color(0xFF212738);
  static const lightGrey = Color(0xFFBBBBBB);
  static const veryLightGrey = Color(0xFFF3F3F3);
  static const white = Color(0xFFFFFFFF);
  static const pink = Color(0xFFF56388);
}

Map<int, Color> materialPurpleCode = {
  50: const Color(0xFF5117AC),
  100: const Color(0xFF5117AC),
  200: const Color(0xFF5117AC),
  300: const Color(0xFF5117AC),
  400: const Color(0xFF5117AC),
  500: const Color(0xFF5117AC),
  600: const Color(0xFF5117AC),
  700: const Color(0xFF5117AC),
  800: const Color(0xFF5117AC),
  900: const Color(0xFF5117AC),
};

MaterialColor materialPurple = MaterialColor(0xFF5117AC, materialPurpleCode);

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide: const BorderSide(
    color: DeliveryColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide: const BorderSide(
    color: DeliveryColors.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

const _iconThemeLight = IconThemeData(
  color: DeliveryColors.purple,
  size: 40,
);

const _iconThemeDark = IconThemeData(
  color: DeliveryColors.white,
  size: 40,
);

final lightTheme = ThemeData(
  canvasColor: DeliveryColors.white,
  scaffoldBackgroundColor: DeliveryColors.white,
  splashColor: DeliveryColors.purple,
  primaryColor: DeliveryColors.purple,
  primarySwatch: materialPurple,
  //shadowColor: DeliveryColors.veryLightGrey,
  bottomAppBarColor: DeliveryColors.veryLightGrey,
  appBarTheme: const AppBarTheme(
    color: DeliveryColors.purple,
    toolbarTextStyle: TextStyle(
      color: DeliveryColors.white,
      fontSize: 22,
      fontWeight: FontWeight.w800,
      
    ),
    titleTextStyle: TextStyle(
      color: DeliveryColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    iconTheme: IconThemeData(color: DeliveryColors.green),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderLight,
    enabledBorder: _borderLight,
    focusedBorder: _borderLight,
    filled: true,
    fillColor: DeliveryColors.veryLightGrey,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.grey,
      fontSize: 16,
    ),
    labelStyle: const TextStyle(
      color: DeliveryColors.purple,
    ),
  ),
  iconTheme: _iconThemeLight,
);

final darkTheme = ThemeData(
  canvasColor: DeliveryColors.dark,
  scaffoldBackgroundColor: DeliveryColors.dark,
  primaryColor: DeliveryColors.purple,
  splashColor: DeliveryColors.white,
  primarySwatch: materialPurple,
  //shadowColor: DeliveryColors.grey,
  bottomAppBarColor: DeliveryColors.grey,
  appBarTheme: const AppBarTheme(
    color: DeliveryColors.purple,
    toolbarTextStyle: TextStyle(
      color: DeliveryColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    titleTextStyle: TextStyle(
      color: DeliveryColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    iconTheme: IconThemeData(color: DeliveryColors.green),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.white,
    displayColor: DeliveryColors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderDark,
    enabledBorder: _borderDark,
    focusedBorder: _borderDark,
    filled: true,
    fillColor: DeliveryColors.grey,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.white,
      fontSize: 16,
    ),
    labelStyle: const TextStyle(
      color: DeliveryColors.green,
    ),
  ),
  iconTheme: _iconThemeDark,
);
