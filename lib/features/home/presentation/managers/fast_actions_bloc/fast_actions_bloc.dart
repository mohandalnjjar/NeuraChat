import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';

part 'fast_actions_event.dart';
part 'fast_actions_state.dart';

class FastActionsBloc extends Bloc<FastActionsBlocEvent, FastActionsBlocState> {
  final HomeRepoImpl homeRepoImpl;

  FastActionsBloc({
    required this.homeRepoImpl,
  }) : super(FastActionsBlocInitial()) {
    on<FastActionsBlocEvent>(
      (event, emit) async {
        if (event is FetchFastActionsBlocEvent) {
          try {
            emit(
              FetchFastActionsBlocLoading(),
            );

            var response = await homeRepoImpl.fetchFastActions(
              currentLang: event.currenLanguage,
            );

            response.fold(
              (failed) {
                emit(
                  FetchFastActionsBlocFailed(errorMessage: failed.errorMessage),
                );
              },
              (success) {
                emit(
                  FetchFastActionsBlocSuccess(fastActions: success),
                );
              },
            );
          } catch (e) {
            emit(
              FetchFastActionsBlocFailed(
                errorMessage: e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
