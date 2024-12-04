// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/clear_chat_bloc_button.dart';
import 'package:neura_chat/generated/l10n.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.hideNeura = true,
  });
  final hideNeura;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(FeatherIcons.arrowLeft),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).Neura,
              style: AppStyles.styleSemiBold24(context),
            ),
            Visibility(
              visible: !hideNeura,
              child: Lottie.asset(
                height: 60,
                Assets.imagesLottieYaHabibi,
              ),
            ),
          ],
        ),
        actions: const [
          ClearChatBlocButton(),
        ],
      ),
    );
  }
}
