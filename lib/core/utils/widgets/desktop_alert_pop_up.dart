import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class DesktopAlertPopUp extends StatelessWidget {
  const DesktopAlertPopUp({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: AppPalette.kPrimaryColor,
            ),
            child: Center(
              child: Text(
                message,
                style: TextStyles.styleRegular15(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
