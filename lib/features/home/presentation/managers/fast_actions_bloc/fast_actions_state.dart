part of 'fast_actions_bloc.dart';

@immutable
sealed class FastActionsBlocState {}

final class FastActionsBlocInitial extends FastActionsBlocState {}

final class FetchFastActionsBlocLoading extends FastActionsBlocState {}

final class FetchFastActionsBlocSuccess extends FastActionsBlocState {
  final List<FastActionModel> fastActions;
  FetchFastActionsBlocSuccess({required this.fastActions});
}

final class FetchFastActionsBlocFailed extends FastActionsBlocState {
  final String errorMessage;

  FetchFastActionsBlocFailed({required this.errorMessage});
}
