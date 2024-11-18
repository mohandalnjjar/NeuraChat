import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/ai_chat_message_widget.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/user_message_widget.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    super.key,
    required this.message,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    return message.isUser
        ? UserMessageWidget(
            message: message,
          )
        : AiChatMessageWidget(message: message);
  }
}
