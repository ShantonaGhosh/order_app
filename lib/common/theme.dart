import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData customTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: kPrimaryColor,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  
  bottomAppBarTheme: const BottomAppBarTheme(
    color: kPrimaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kPrimaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
  ),
  useMaterial3: false,
  // unselectedWidgetColor: kPrimaryColor,
  //primarySwatch: kPrimaryColor,
  primaryColor: kPrimaryColor,
  canvasColor: Colors.grey.shade100,
);
