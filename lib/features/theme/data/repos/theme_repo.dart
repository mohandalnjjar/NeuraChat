import 'package:flutter/material.dart';

abstract class ThemeRepo {
  Future<void> setTheme({required bool themeValue});
  Future<void> getTheme({required BuildContext context});
}
