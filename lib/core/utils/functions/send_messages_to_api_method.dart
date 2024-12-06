import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';

void sendToApi(BuildContext context, String message, String chatId) {
  context.read<SendMessageCubit>().sendMessage(
        chatMessageModel: ChatMessageModel(
          chatId: chatId,
          createdAt: Timestamp.now(),
          message: Message(
            isUser: true,
            content: message,
          ),
        ),
      );

  if (!fetched) {
    BlocProvider.of<GetMessagesBloc>(context).add(
      FetchMessagesEvent(chatId: chatId),
    );
    setState(() {
      fetched = true;
    });
  }
  controller.clear();

  setState(() {
    isEmpty = true;
  });
  FocusScope.of(context).unfocus();
}
