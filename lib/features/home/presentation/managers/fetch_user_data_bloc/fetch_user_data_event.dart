part of 'fetch_user_data_bloc.dart';

@immutable
sealed class UserDataEvent {}

class FetchUserDataEvent extends UserDataEvent {}
