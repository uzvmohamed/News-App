import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;
ThemeData theme() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Colors.black54,
      contentPadding: const EdgeInsets.all(10),
      hintStyle: const TextStyle(color: Colors.black54),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black54, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.black54,
          width: 2,
        ),
      ),
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.black, fontSize: 18),
        displaySmall: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
    primarySwatch: primaryBlack,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      selectedItemColor: Colors.black,
      elevation: 20,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ).copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      color: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 24,
      ),
      titleTextStyle: const TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
