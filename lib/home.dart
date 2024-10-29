
import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/app_text_styles.dart';

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
            'Hi, Muhanad',
            style: TextStyles.styleRegular20(context),
          ),
        ),
      ),
    );
  }
}
