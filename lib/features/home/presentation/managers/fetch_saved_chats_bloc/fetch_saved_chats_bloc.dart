import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';

part 'fetch_saved_chats_event.dart';
part 'fetch_saved_chats_state.dart';

class FetchSavedChatsBloc
    extends Bloc<FetchSavedChatsEvent, FetchSavedChatsState> {
  final HomeRepo homeRepo;
  FetchSavedChatsBloc(this.homeRepo) : super(FetchSavedChatsInitial()) {
    on<FetchSavedChatsEvent>((event, emit) async {
      emit(
        FetchSavedChatsLoading(),
      );
      if (event is PerformFetchSavedChatsEvent) {
        await for (final response in homeRepo.fetchSavedChats()) {
          response.fold(
            (failed) {
              emit(
                FetchSavedChatsFailed(
                  errorMessage: failed.errorMessage,
                ),
              );
            },
            (success) {
              emit(
                FetchSavedChatsSuccess(savedChats: success),
              );
            },
          );
        }
      }
    });
  }
}
