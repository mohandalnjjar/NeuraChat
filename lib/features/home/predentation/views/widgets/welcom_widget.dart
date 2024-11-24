import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class WelcomWidget extends StatelessWidget {
  const WelcomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Any Neura any thing',
      style: AppStyles.styleBold24(context),
    );
  }
}
