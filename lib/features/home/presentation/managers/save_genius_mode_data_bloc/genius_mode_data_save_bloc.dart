import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';

part 'genius_mode_data_save_event.dart';
part 'genius_mode_data_save_state.dart';

class GeniusModeDataSaveBloc
    extends Bloc<GeniusModeDataSaveEvent, GeniusModeSaveState> {
  final HomeRepoImpl homeRepoImpl;

  GeniusModeDataSaveBloc({required this.homeRepoImpl})
      : super(GeniusModeDataSaveInitial()) {
    on<GeniusModeDataSaveEvent>((event, emit) async {
      if (event is PerformGeniusModeDataSaveEvent) {
        emit(
          GeniusModeDataSaveLoading(),
        );

        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );

        var response = await homeRepoImpl.saveInstruction(
          instruction: event.instruction,
          geniusMode: event.geniusMode,
        );
        response.fold(
          (failed) {
            emit(
              GeniusModeDataSaveFailed(errorMessage: failed.errorMessage),
            );
          },
          (success) {
            emit(
              GeniusModeDataSaveSucces(),
            );
          },
        );
      }
    });
  }
}
