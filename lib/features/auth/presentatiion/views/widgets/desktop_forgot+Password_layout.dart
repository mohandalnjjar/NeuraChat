import 'package:flutter/material.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/mobile_forgot_password_layout.dart';

class DesktopForgotPasswordViewLayout extends StatelessWidget {
  const DesktopForgotPasswordViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: MobileForgotPassswordBody(),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
