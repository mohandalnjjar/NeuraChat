import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neura_chat/core/utils/widgets/adaptive_layout.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/desktop_register_vewi_layotu.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/mobile_register_view_Layotu.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const MobileRegisterViewLayotu(),
      tabletLayout: (context) => const MobileRegisterViewLayotu(),
      desktopLayout: (context) => const DesktopRegisterViewLayotu(),
    );
  }
}
