part of 'sign_in_anonymously_cubit.dart';

@immutable
sealed class SignInAnonymouslyState {}

final class SignInAnonymouslyInitial extends SignInAnonymouslyState {}

final class SignInAnonymouslyLoading extends SignInAnonymouslyState {}

final class SignInAnonymouslySuccess extends SignInAnonymouslyState {}

final class SignInAnonymouslyFailed extends SignInAnonymouslyState {}
