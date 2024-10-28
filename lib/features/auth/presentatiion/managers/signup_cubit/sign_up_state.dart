part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpLoadding extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}
