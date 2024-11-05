part of 'rest_password_cubit.dart';

@immutable
sealed class RestPasswordState {}

final class RestPasswordInitial extends RestPasswordState {}

final class RestPasswordLoading extends RestPasswordState {}

final class RestPasswordDone extends RestPasswordState {}

final class RestPasswordFailed extends RestPasswordState {
  final String errorMessage;

  RestPasswordFailed({required this.errorMessage});
}
