import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swift_mart/core/utils/services/adaptive_layout.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/desktop_register_vewi_layotu.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/mobile_register_view_Layotu.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
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
