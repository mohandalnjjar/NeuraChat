import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';

class AiChatMessageWidget extends StatelessWidget {
  const AiChatMessageWidget({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: MarkdownBody(
                data: message.content,
                styleSheet: MarkdownStyleSheet(
                  p: AppStyles.styleRegular16(context),
                  h1: AppStyles.styleBold32(context),
                  h2: AppStyles.styleBold28(context),
                  h3: AppStyles.styleBold22(context),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Icon(FeatherIcons.messageCircle),
        ],
      ),
    );
  }
}
