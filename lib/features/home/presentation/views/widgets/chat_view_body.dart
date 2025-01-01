import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/messages_list_widget.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/neura_loading_orb.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/send_message_widget.dart';
import 'package:neura_chat/generated/l10n.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({
    super.key,
    this.initialValue,
    this.savedChats,
  });

  final String? initialValue;
  final SavedChatModel? savedChats;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MessagesListWidget(),
        const NeuraLoadingOrb(),
        SendMessageWidget(
          chatId: savedChats?.chatId,
          initialValue: initialValue,
          hintText: S.of(context).AskAnyQuestion,
        ),
      ],
    );
  }
}
