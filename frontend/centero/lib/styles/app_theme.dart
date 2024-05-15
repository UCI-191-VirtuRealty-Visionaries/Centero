import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.green,
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16),
    ),
  
  );


  ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 223, 27, 12),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      );

  // Add more theme data as needed

}