import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/theme/data/repos/theme_repo_impl.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit(this.themeRepoImpl) : super(ThemeCubitInitial());

  final ThemeRepoImpl themeRepoImpl;

  bool themeMode = false;
  bool get getThemeMode => themeMode;

  Future<void> changAppTheme({required bool themeValue}) async {
    await themeRepoImpl.setTheme(themeValue: themeValue);
    themeMode = themeValue;

    emit(
      ThemeCubitSuccess(),
    );
  }

  Future<void> getTheme() async {
    themeMode = await themeRepoImpl.getTheme();
    emit(
      GetThemeCubitSuccess(),
    );
  }
}
