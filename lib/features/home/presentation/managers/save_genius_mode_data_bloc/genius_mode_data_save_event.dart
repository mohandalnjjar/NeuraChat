part of 'genius_mode_data_save_bloc.dart';

@immutable
sealed class GeniusModeDataSaveEvent {}

class PerformGeniusModeDataSaveEvent extends GeniusModeDataSaveEvent {
  final GeniusMode geniusMode;
  final String instruction;

  PerformGeniusModeDataSaveEvent({
    required this.geniusMode,
    required this.instruction,
  });
}
