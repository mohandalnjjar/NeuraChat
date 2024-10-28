part of 'google_login_cubit.dart';

@immutable
sealed class GoogleLoginState {}

final class GoogleLoginInitial extends GoogleLoginState {}

final class GoogleLoginLoading extends GoogleLoginState {}

final class GoogleLoginDone extends GoogleLoginState {}

final class GoogleLoginFailed extends GoogleLoginState {
  final String errorMessage;

  GoogleLoginFailed({required this.errorMessage});
}
