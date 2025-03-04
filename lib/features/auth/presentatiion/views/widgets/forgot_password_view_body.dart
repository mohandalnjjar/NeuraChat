import 'package:flutter/material.dart';
import 'package:neura_chat/core/utils/widgets/adaptive_layout.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/desktop_forgot+Password_layout.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/mobile_forgot_password_layout.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const MobileForgotPassswordBody(),
      tabletLayout: (context) => const MobileForgotPassswordBody(),
      desktopLayout: (context) => const DesktopForgotPasswordViewLayout(),
    );
  }
}
