import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class AppBarItemWidget extends StatelessWidget {
  const AppBarItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.leading,
  });

  final String title;
  final void Function() onTap;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: AppStyles.styleSemiBold20(context),
        ),
        onTap: onTap,
      ),
    );
  }
}
