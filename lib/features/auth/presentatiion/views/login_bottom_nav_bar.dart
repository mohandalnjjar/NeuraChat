import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';

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
              GoRouter.of(context).push(RouterPath.kRegisterView);
            },
            child: const Text(
              'Register',
            ),
          ),
        ],
      ),
    );
  }
}
