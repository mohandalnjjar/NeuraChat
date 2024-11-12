import 'package:flutter/material.dart';
import 'package:neura_chat/core/utils/widgets/adaptive_layout.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/desktop_login_layout.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/mobile_login_layout.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) {
        return const MobileLoginLayout();
      },
      tabletLayout: (BuildContext context) {
        return const MobileLoginLayout();
      },
      desktopLayout: (BuildContext context) {
        return const DesktopLoginLayout();
      },
    );
  }
}
