import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/language/data/repos/language_repo_impl.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({required this.languageRepoImpl}) : super(LanguageInitial());
  final LanguageRepoImpl languageRepoImpl;
  String currentLanguage = 'en';

  Future<void> changeAppLanguage({required String langValue}) async {
    emit(
      LanguageLoading(),
    );
    var result = await languageRepoImpl.setLanguage(langValue: langValue);
    currentLanguage = langValue;

    result.fold(
      (langFailed) {
        emit(
          LanguageFailed(errorMeassage: langFailed),
        );
      },
      (langChanged) {
        emit(
          LanguageChangeDone(),
        );
      },
    );
  }

  Future<void> getAppLanguage({required BuildContext context}) async {
    emit(
      LanguageLoading(),
    );
    var result = await languageRepoImpl.getLanguage(context: context);

    result.fold(
      (langFailed) {
        emit(
          LanguageFailed(errorMeassage: langFailed),
        );
      },
      (getDone) {
        currentLanguage = getDone;

        emit(
          GetLanguageDone(),
        );
      },
    );
  }
}
