import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({
    super.key,
    required this.title,
    required this.viewRouter,
  });
  final String title;
  final String viewRouter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.styleBold25(context),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(viewRouter);
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppPalette.kSecondaryDarkColor,
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
