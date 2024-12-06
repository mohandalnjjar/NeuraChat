import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_routes.dart';

class AskMeButton extends StatelessWidget {
  const AskMeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: ElevatedButton(
        onPressed: () async {
          await GoRouter.of(context).push(AppRoutes.kChatView);
        },
        child: const Text(
          "Ask Me Any Thing",
        ),
      ),
    );
  }
}
