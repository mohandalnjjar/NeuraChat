part of 'update_user_data_bloc.dart';

@immutable
sealed class UpdateUserDataEvent {}

class PerfromUpdateUserDataEvent extends UpdateUserDataEvent {
  final String? name;
  final String? responseMode;
  final String? userInstuctions;

  PerfromUpdateUserDataEvent({
    this.name,
    this.responseMode,
    this.userInstuctions,
  });
}
