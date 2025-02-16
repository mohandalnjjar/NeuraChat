part of 'log_out_bloc_bloc.dart';

@immutable
sealed class LogOutBlocState {}

final class LogOutBlocInitial extends LogOutBlocState {}

final class LogOutBlocLoading extends LogOutBlocState {}

final class LogOutBlocSuccess extends LogOutBlocState {}

final class LogOutBlocFailed extends LogOutBlocState {
  final String errorMessage;

  LogOutBlocFailed({required this.errorMessage});
}
