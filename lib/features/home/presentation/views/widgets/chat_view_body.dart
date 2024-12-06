import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/messages_list_widget.dart';
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
        SendMessageWidget(
          initialValue: initialValue,
          hintText: S.of(context).AskAnyQuestion,
          uploadAssetsButtom: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kChatView);
            },
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
