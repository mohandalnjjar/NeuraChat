import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/display_message_dialog.dart';

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
      child: InkWell(
        onLongPress: () => displayMessageDialog(context, message.content),
        child: Row(children: [
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
        ]),
      ),
    );
  }
}
