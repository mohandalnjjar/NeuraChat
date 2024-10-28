import 'package:flutter/material.dart';
import 'package:neura_chat/features/theme/data/repos/theme_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepoImpl extends ThemeRepo {
  
  static const String _themeStatusKey = 'theme_status';

  @override
  Future<void> setTheme({required bool themeValue}) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool(_themeStatusKey, themeValue);
  }

  @override
  Future<bool> getTheme({required BuildContext context}) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_themeStatusKey) ?? false;
  }
}

