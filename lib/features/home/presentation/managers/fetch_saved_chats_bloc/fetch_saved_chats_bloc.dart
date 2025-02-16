import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';

part 'fetch_saved_chats_event.dart';
part 'fetch_saved_chats_state.dart';

class FetchSavedChatsBloc
    extends Bloc<FetchSavedChatsEvent, FetchSavedChatsState> {
  final HomeRepo homeRepo;
  FetchSavedChatsBloc(this.homeRepo) : super(FetchSavedChatsInitial()) {
    on<FetchSavedChatsEvent>((event, emit) async {
      if (event is FetchIntialSavedChatsEvent) {
        emit(
          FetchSavedChatsLoading(),
        );
        var response = await homeRepo.fetchInitialSavedChats();
        response.fold(
          (failed) {
            emit(
              FetchSavedChatsFailed(errorMessage: failed.errorMessage),
            );
          },
          (success) {
            emit(
              FetchSavedChatsSuccess(savedChats: success),
            );
          },
        );
      } else if (event is FetchSavedMoreChatsEvent) {
        var response = await homeRepo.fetchMoreSavedChats(event.lastMessagel);
        response.fold(
          (failed) {
            emit(
              FetchSavedChatsFailed(errorMessage: failed.errorMessage),
            );
          },
          (success) {
            emit(
              FetchSavedChatsSuccess(savedChats: success),
            );
          },
        );
      }
    });
  }
}
