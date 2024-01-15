import 'package:flutter/material.dart';
import 'package:schoolap_pkg/src/theme/data/colors.dart';

import 'data/radius.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData defaultTheme = ThemeData(
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: AppColorsData.blanc,
      selectedIconTheme: IconThemeData(color: AppColorsData.bleuLight),
      unselectedIconTheme: IconThemeData(color: AppColorsData.blanc),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: AppColorsData.bleuLight),
      selectedItemColor: AppColorsData.bleu,
      unselectedIconTheme: IconThemeData(color: AppColorsData.blanc),
      unselectedItemColor: AppColorsData.grid1,
    ),
    buttonTheme: ButtonThemeData(
      height: 45,
      buttonColor: AppColorsData.orange,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          const AppRadiusData.primary().small,
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColorsData.blanc,
  );
}
