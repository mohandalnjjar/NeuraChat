part of 'fast_actions_bloc.dart';

@immutable
sealed class FastActionsBlocEvent {}

class FetchFastActionsBlocEvent extends FastActionsBlocEvent {
  final String currenLanguage;

  FetchFastActionsBlocEvent({required this.currenLanguage});
}
