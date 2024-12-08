import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      onPressed: () =>
          GoRouter.of(context).pushReplacement(AppRoutes.kLoginView),
      child: Text(
        "Sign In",
        style: AppStyles.styleSemiBold15(context),
      ),
    );
  }
}
