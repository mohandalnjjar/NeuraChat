import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/functions/copy_method.dart';

Future<dynamic> displayMessageDialog(BuildContext context, String content) {
  return showDialog(
    context: context,
    builder: (context) {
      return Stack(
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).dialogTheme.backgroundColor,
              ),
              child: IconButton(
                onPressed: () {
                  copyMethod(context, content);
                  context.pop();
                },
                icon: Row(
                  children: [
                    const Icon(
                      FeatherIcons.copy,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Copy',
                      style: AppStyles.styleSemiBold15(context),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
