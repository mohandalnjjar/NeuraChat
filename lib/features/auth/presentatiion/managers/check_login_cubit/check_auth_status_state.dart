part of 'check_auth_status_cubit.dart';

@immutable
sealed class CheckAuthStatusState {}

final class CheckAuthStatusStateInitial extends CheckAuthStatusState {}

final class CheckAuthStatusStateSeen extends CheckAuthStatusState {}

final class CheckAuthStatusStateNotSeen extends CheckAuthStatusState {}
