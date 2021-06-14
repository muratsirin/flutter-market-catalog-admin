import 'package:flutter/material.dart';
import 'package:market_katalog/utils/constants.dart';

ThemeData appThemeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: kAppBarColor,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: kAppPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: kAppPrimaryColor,
      ),
      elevation: 5,
    ),
    scaffoldBackgroundColor: kScaffoldColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kAppPrimaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kAppBarColor,
      selectedItemColor: kAppPrimaryColor,
    ),
    primaryColor: kAppPrimaryColor,
  );
}
