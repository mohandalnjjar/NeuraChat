import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/generated/l10n.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      sliver: SliverAppBar(
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(FeatherIcons.menu),
        ),
        centerTitle: true,
        title: Text(
          S.of(context).Neura,
          style: AppStyles.styleSemiBold23(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.edit,
            ),
          )
        ],
      ),
    );
  }
}
