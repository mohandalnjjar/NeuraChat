import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:neura_chat/features/language/data/repos/language_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageRepoImpl extends LanguageRepo {
  final String chosenLanguageKey = 'chosen_language';

  @override
  Future<Either<String, void>> setLanguage({required String langValue}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      await prefs.setString(chosenLanguageKey, langValue);
      return const Right(null);
    } catch (e) {
      return Left(
        e.toString(),
      );
    }
  }

  @override
  Future<Either<String, String>> getLanguage(
      {required BuildContext context}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final language = preferences.getString(chosenLanguageKey) ?? 'en';
      return Right(language);
    } catch (e) {
      return Left(
        e.toString(),
      );
    }
  }
}
