import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/widgets/my_icon_button.dart';

class GeniusModeViewAppBar extends StatelessWidget {
  const GeniusModeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: MyIconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          "Genius Mode",
          style: AppStyles.styleSemiBold24(context),
        ),
      ),
    );
  }
}
