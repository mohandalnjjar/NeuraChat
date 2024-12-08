part of 'check_auth_state_bloc.dart';

@immutable
sealed class CheckAuthStateEvent {}

class PerformCheckAuthEvent extends CheckAuthStateEvent {}
