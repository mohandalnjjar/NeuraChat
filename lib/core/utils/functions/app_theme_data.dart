import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

ThemeData appThemeData({required bool isDark, required BuildContext context}) {
  return ThemeData(
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: isDark ? Colors.white : Colors.black),
    listTileTheme: ListTileThemeData(
      iconColor: isDark ? Colors.white : Colors.black,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: isDark
          ? AppPalette.kDarkScaffoldColor
          : AppPalette.kwhitModeMessageColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: isDark
          ? AppPalette.kDarkScaffoldColor
          : AppPalette.kLightScaffoldColor,
    ),
    iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: isDark ? Colors.black : Colors.white,
        backgroundColor:
            isDark ? AppPalette.kDarkModeButtom : AppPalette.kWhiteModeButtom,
        padding: const EdgeInsets.all(13),
        textStyle: isDark
            ? AppStyles.styleBold19(context)
            : AppStyles.styleBold19(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: isDark
          ? AppPalette.kSecondaryDarkColor
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
