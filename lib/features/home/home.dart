import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/generated/l10n.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            S.of(context).NeuraChat,
            style: TextStyles.styleRegular20(context),
          ),
        ),
      ),
    );
  }
}
