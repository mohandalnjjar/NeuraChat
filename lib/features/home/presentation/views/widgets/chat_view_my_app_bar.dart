import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/widgets/my_icon_button.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/Save_chat_bloc_button.dart';
import 'package:neura_chat/generated/l10n.dart';

class ChatViewAppBar extends StatelessWidget {
  const ChatViewAppBar({
    super.key,
    this.chatId,
  });
  final String? chatId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: MyIconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          S.of(context).Neura,
          style: AppStyles.styleSemiBold24(context),
        ),
        actions: [
          SaveChatButton(
            chatid: chatId,
          ),
        ],
      ),
    );
  }
}
