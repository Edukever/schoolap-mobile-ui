import 'package:flutter/material.dart';
import 'package:schoolap_ui/src/theme/data/colors.dart';

import 'data/radius.dart';

class AppMaterialTheme {
  AppMaterialTheme._();

  static ThemeData defaultTheme(SPColorsData colors) {
    return ThemeData(
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: colors.blanc,
        selectedIconTheme: IconThemeData(color: colors.bleuLight),
        unselectedIconTheme: IconThemeData(color: colors.blanc),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: colors.bleuLight),
        selectedItemColor: colors.bleu,
        unselectedIconTheme: IconThemeData(color: colors.blanc),
        unselectedItemColor: colors.grid1,
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
      scaffoldBackgroundColor: colors.blanc,
      fontFamily: 'Poppins'
    );
  }
}
