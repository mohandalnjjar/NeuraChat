import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final HomeRepoImpl homeRepoImpl;

  SendMessageCubit({required this.homeRepoImpl}) : super(MessageInitial());

  Future<void> sendMessage({
    required ChatMessageModel chatMessageModel,
  }) async {
    emit(
      MessageLoading(),
    );
    await homeRepoImpl.uploadMessageToFirebase(
      chatMessageModel: chatMessageModel,
    );

    final result = await homeRepoImpl.sendMessage(
      userMessage: chatMessageModel.message.content,
    );

    result.fold(
      (failure) {
        emit(
          MessageSentFailure(
            errorMessage: failure.toString(),
          ),
        );
      },
      (messageModel) async {
        await homeRepoImpl.uploadMessageToFirebase(
          chatMessageModel: ChatMessageModel(
            chatId: chatMessageModel.chatId,
            createdAt: chatMessageModel.createdAt,
            message: Message(
              isUser: false,
              content: messageModel.message,
            ),
          ),
        );

        emit(
          MessageSentSuccess(),
        );
      },
    );
  }
}
