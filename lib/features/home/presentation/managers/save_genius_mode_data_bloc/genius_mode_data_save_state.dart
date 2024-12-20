part of 'genius_mode_data_save_bloc.dart';

@immutable
sealed class GeniusModeSaveState {}

final class GeniusModeDataSaveInitial extends GeniusModeSaveState {}

final class GeniusModeDataSaveLoading extends GeniusModeSaveState {}

final class GeniusModeDataSaveFailed extends GeniusModeSaveState {
  final String errorMessage;

  GeniusModeDataSaveFailed({required this.errorMessage});
}

final class GeniusModeDataSaveSucces extends GeniusModeSaveState {}
