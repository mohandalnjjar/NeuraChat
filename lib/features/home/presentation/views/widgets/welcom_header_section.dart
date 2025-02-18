import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/generated/l10n.dart';

class WelcomeHeaderSection extends StatelessWidget {
  const WelcomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).HelloHowCanIHelp,
          style: AppStyles.styleBold28(context),
        ),
      ],
    );
  }
}
