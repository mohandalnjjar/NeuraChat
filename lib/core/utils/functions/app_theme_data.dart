import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neura_chat/core/constants/app_palette.dart';

ThemeData appThemeData({required bool isDark, required BuildContext context}) {
  return ThemeData(
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: isDark
          ? AppPalette.kDarkScaffoldColor
          : AppPalette.kLightScaffoldColor,
    ),
    iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isDark ? AppPalette.kDarkModeButtom : AppPalette.kWhiteModeButtom,
        elevation: 0,
        padding: const EdgeInsets.all(
          13,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: isDark
          ? AppPalette.kwhitDarkMessageColor
          : AppPalette.kwhitModeMessageColor,
    ),
    scaffoldBackgroundColor:
        isDark ? AppPalette.kDarkScaffoldColor : AppPalette.kLightScaffoldColor,
    brightness: isDark ? Brightness.dark : Brightness.light,
    textTheme: isDark
        ? GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          )
        : GoogleFonts.poppinsTextTheme(),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: isDark
          ? AppPalette.kDarkScaffoldColor
          : AppPalette.kLightScaffoldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: isDark
          ? AppPalette.kDarkScaffoldColor
          : AppPalette.kLightScaffoldColor,
    ),
  );
}
