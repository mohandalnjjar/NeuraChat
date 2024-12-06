import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/messages_list_widget.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/neura_loading_orb.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/send_message_widget.dart';
import 'package:neura_chat/generated/l10n.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({
    super.key,
    this.initialValue,
  });

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MessagesListWidget(),
        const NeuraLoadingOrb(),
        SendMessageWidget(
          initialValue: initialValue,
          hintText: S.of(context).AskAnyQuestion,
        ),
      ],
    );
  }
}
