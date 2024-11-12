import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    super.key,
  });

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
              child: Text(
                "Hi there! How can I help you today? This is a long message to check how the text wraps correctly when the width is limited.",
                style: AppStyles.styleRegular16(context),
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
