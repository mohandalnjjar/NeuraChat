import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';

part 'get_messages_event.dart';
part 'get_messages_state.dart';

class GetMessagesBloc extends Bloc<GetMessagesEvent, GetMessagesState> {
  final HomeRepoImpl homeRepoImpl;

  GetMessagesBloc({
    required this.homeRepoImpl,
  }) : super(GetMessagesInitial()) {
    on<GetMessagesEvent>(
      (event, emit) async {
        if (event is FetchMessagesEvent) {
          try {

            
            emit(
              GetMessagesloading(),
            );
            await for (final response
                in homeRepoImpl.fetchStreamMessages(chatId: event.chatId)) {
              response.fold(
                (failed) {
                  emit(
                    GetMessagesFailed(
                      errorMessage: failed.errorMessage,
                    ),
                  );
                },
                (success) {
                  emit(
                    GetMessagesSuccess(
                      messagesList: success,
                    ),
                  );
                },
              );
            }
          } catch (e) {
            emit(
              GetMessagesFailed(
                errorMessage: e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
