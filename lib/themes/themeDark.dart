// ignore_for_file: file_names
import 'package:flutter/material.dart';

ThemeData themes = ThemeData(
  scaffoldBackgroundColor: const Color(0xff404040),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: const MaterialStatePropertyAll(Colors.blueGrey))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: const MaterialStatePropertyAll(Colors.blueGrey))),
  appBarTheme:
      const AppBarTheme(backgroundColor: Color(0xff404040), centerTitle: true),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff404040), selectedItemColor: Colors.white),
  cardTheme: CardTheme(
      color: Colors.blueGrey,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
);
