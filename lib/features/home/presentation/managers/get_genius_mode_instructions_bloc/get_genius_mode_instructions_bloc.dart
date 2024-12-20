import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';

part 'get_genius_mode_instructions_event.dart';
part 'get_genius_mode_instructions_state.dart';

class GetGeniusModeInstructionsBloc extends Bloc<GetGeniusModeInstructionsEvent,
    GetGeniusModeInstructionsState> {
  final HomeRepoImpl homeRepoImpl;
  GetGeniusModeInstructionsBloc(this.homeRepoImpl)
      : super(GetGeniusModeInstructionsInitial()) {
    on<GetGeniusModeInstructionsEvent>((event, emit) async {
      if (event is PerformGetGeniusModeInstructionsEvent) {
        emit(
          GetGeniusModeInstructionsLoading(),
        );

        var response = await homeRepoImpl.getSavedInstruction();

        response.fold(
          (failed) {
            emit(
              GetGeniusModeInstructionsLoading(),
            );
          },
          (success) {
            emit(
              GetGeniusModeInstructionsSuccess(instructions: success),
            );
          },
        );
      }
    });
  }
}
