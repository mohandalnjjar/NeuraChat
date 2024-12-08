import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/user_image_widget.dart';
import 'package:neura_chat/generated/l10n.dart';

class WelcomViewAppBar extends StatelessWidget {
  const WelcomViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const UserImageWidget(),
      ),
      title: Text(
        S.of(context).Neura,
        style: AppStyles.styleSemiBold24(context),
      ),
    );
  }
}
