import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class WelcomeHeaderSection extends StatelessWidget {
  const WelcomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, Muhanad",
              style: AppStyles.styleBold28(context),
            ),
            Lottie.asset(
              Assets.imagesLottieYaHabibi,
              height: 70,
            ),
          ],
        ),
      ],
    );
  }
}
