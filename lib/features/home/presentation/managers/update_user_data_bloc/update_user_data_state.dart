part of 'update_user_data_bloc.dart';

@immutable
sealed class UpdateUserDataState {}

final class UpdateUserDataInitial extends UpdateUserDataState {}

final class UpdateUserDataLoading extends UpdateUserDataState {}

final class UpdateUserDataSuccess extends UpdateUserDataState {}

final class UpdateUserDataFailed extends UpdateUserDataState {
  final String errorMessage;
  UpdateUserDataFailed({required this.errorMessage});
}
