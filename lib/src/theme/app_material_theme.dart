import 'package:flutter/material.dart';
import 'package:schoolap_ui/src/theme/data/colors.dart';

import 'data/radius.dart';

class AppMaterialTheme {
  AppMaterialTheme._();

  static ThemeData defaultTheme(SPColorsData colors) {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors.white,
        ),
        timePickerTheme: TimePickerThemeData(
          backgroundColor: colors.white,
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: colors.white,
          selectedIconTheme: IconThemeData(color: colors.blueLight),
          unselectedIconTheme: IconThemeData(color: colors.white),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: colors.blueLight),
          selectedItemColor: colors.blue,
          unselectedIconTheme: IconThemeData(color: colors.white),
          unselectedItemColor: colors.gray1,
        ),
        buttonTheme: ButtonThemeData(
          height: 45,
          buttonColor: colors.orange,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              const AppRadiusData.primary().small,
            ),
          ),
        ),
        scaffoldBackgroundColor: colors.white,
        fontFamily: 'Poppins');
  }
}
