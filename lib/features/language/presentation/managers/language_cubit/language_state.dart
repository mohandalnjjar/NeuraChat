part of 'language_cubit.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}

final class LanguageLoading extends LanguageState {}

final class LanguageChangeDone extends LanguageState {}

final class GetLanguageDone extends LanguageState {}

final class LanguageFailed extends LanguageState {
  final String errorMeassage;

  LanguageFailed({required this.errorMeassage});
}
