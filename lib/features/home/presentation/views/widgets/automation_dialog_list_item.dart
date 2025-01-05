import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class AutomationDialogListItem extends StatelessWidget {
  const AutomationDialogListItem({
    super.key,
    required this.prompt,
  });
  final String prompt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoutes.kChatView,
          extra: {
            'savedChats': null,
            'initialValue': prompt,
          },
        );
        context.pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Text(
            prompt,
            style: AppStyles.styleSemiBold18(context),
          ),
        ),
      ),
    );
  }
}
