import 'package:flutter/material.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/mobile_register_view_Layotu.dart';

class DesktopRegisterViewLayotu extends StatelessWidget {
  const DesktopRegisterViewLayotu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: MobileRegisterViewLayotu(),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
