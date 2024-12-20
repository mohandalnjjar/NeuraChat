part of 'get_genius_mode_instructions_bloc.dart';

@immutable
sealed class GetGeniusModeInstructionsState {}

final class GetGeniusModeInstructionsInitial
    extends GetGeniusModeInstructionsState {}

final class GetGeniusModeInstructionsLoading
    extends GetGeniusModeInstructionsState {}

final class GetGeniusModeInstructionsSuccess
    extends GetGeniusModeInstructionsState {
  final Map<String, String?> instructions;

  GetGeniusModeInstructionsSuccess({required this.instructions});
}

final class GetGeniusModeInstructionsFailed
    extends GetGeniusModeInstructionsState {}
