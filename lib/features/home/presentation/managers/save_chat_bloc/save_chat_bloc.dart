import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';

part 'save_chat_event.dart';
part 'save_chat_state.dart';

class SaveChatBloc extends Bloc<SaveChatEvent, SaveChatState> {
  final HomeRepo homeRepo;
  final InternetConnectivity internetConnectivity;

  SaveChatBloc({
    required this.homeRepo,
    required this.internetConnectivity,
  }) : super(SaveChatInitial()) {
    on<SaveChatEvent>(
      (event, emit) async {
        emit(
          SaveChatLoading(),
        );

        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );

        bool isConnected = await internetConnectivity.isInternetAvailable();
        if (!isConnected) {
          emit(
            SaveChatFailed(
              errorMessage: 'No internet connection',
            ),
          );
          return;
        }
        if (event is PerformSaveChatEvent) {
          var result = await homeRepo.saveChat(messages: event.messages);
          result.fold(
            (failed) {
              emit(
                SaveChatFailed(errorMessage: failed.errorMessage),
              );
            },
            (success) {
              emit(SaveChatSucess());
            },
          );
        }
      },
    );
  }
}
