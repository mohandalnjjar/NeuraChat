import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final HomeRepoImpl homeRepoImpl;
  final List<Message> messages = [];

  SendMessageCubit({required this.homeRepoImpl}) : super(MessageInitial());

  Future<void> sendMessage({
    required Message message,
  }) async {
    if (messages.isNotEmpty && messages.last.content == message.content) {
      messages.removeLast();
    }
    messages.add(message);

    emit(
      MessageSentSuccess(messages: messages),
    );

    emit(
      MessageSentLoading(),
    );

    final result = await homeRepoImpl.sendMessage(
      userMessage: message.content,
    );

    result.fold(
      (failure) {
        emit(
          MessageSentFailure(
            errorMessage: failure.toString(),
            lastMessage: message,
          ),
        );
      },
      (messageModel) async {
        messages.add(
          Message(
            isUser: false,
            content: messageModel.message,
          ),
        );
        emit(
          MessageSentSuccess(messages: messages),
        );
      },
    );
  }
}
