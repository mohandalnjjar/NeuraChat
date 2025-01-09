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
    required ChatMessageModel chatMessageModel,
  }) async {
    emit(
      MessageSentLoading(),
    );

    messages.add(chatMessageModel.message);

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
        messages.add(Message(
          isUser: false,
          content: messageModel.message,
        ));
        //i will handle for just send the new messages not the entire list
        emit(
          MessageSentSuccess(messages: messages),
        );
      },
    );
  }
}
