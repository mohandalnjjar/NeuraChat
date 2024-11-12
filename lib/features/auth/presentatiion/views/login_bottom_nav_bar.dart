import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/generated/l10n.dart';

class LoginButtomNavBar extends StatelessWidget {
  const LoginButtomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'New To Loginstics?',
          ),
          TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kRegisterView);
            },
            child: Text(
              S.of(context).register,
            ),
          ),
        ],
      ),
    );
  }
}
