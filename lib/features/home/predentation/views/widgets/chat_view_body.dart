import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/messages_list_widget.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/send_message_widget.dart';
import 'package:neura_chat/generated/l10n.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MessagesListWidget(),
        SendMessageWidget(
          hintText: S.of(context).AskAnyQuestion,
          uploadAssetsButtom: GestureDetector(
            onTap: () {},
            child: const Icon(
              FeatherIcons.plus,
              size: 27,
            ),
          ),
        ),
      ],
    );
  }
}
