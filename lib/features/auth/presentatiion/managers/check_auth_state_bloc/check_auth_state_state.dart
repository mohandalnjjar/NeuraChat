part of 'check_auth_state_bloc.dart';

@immutable
sealed class CheckAuthStateState {}

final class CheckAuthStateInitial extends CheckAuthStateState {}

class Authenticated extends CheckAuthStateState {
  final bool isanonymous;

  Authenticated({this.isanonymous = false});
}

class Unauthenticated extends CheckAuthStateState {
  final String authMessage;

  Unauthenticated({
    required this.authMessage,
  });
}
