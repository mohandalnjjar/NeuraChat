import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/predentation/managers/send_message_cubit/send_message_cubit_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final HomeRepoImpl homeRepoImpl;

  MessageCubit({required this.homeRepoImpl}) : super(MessageInitial());

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
      message: chatMessageModel.message.content,
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
