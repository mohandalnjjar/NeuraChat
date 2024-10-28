part of 'theme_cubit.dart';

@immutable
sealed class ThemeCubitState {}

final class ThemeCubitInitial extends ThemeCubitState {}

final class ThemeCubitSuccess extends ThemeCubitState {}

final class GetThemeCubitSuccess extends ThemeCubitState {
  GetThemeCubitSuccess();
}
