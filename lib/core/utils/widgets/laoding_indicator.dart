import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/generated/l10n.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.absorbing = false,
  });

  final bool absorbing;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).dialogTheme.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    Assets.imagesNeuraOrb,
                    height: 88,
                  ),
                  Text(
                    S.of(context).loading,
                    style: AppStyles.style700w16(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
