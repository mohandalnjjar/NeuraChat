import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/app_drawer.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/welcom_view_body.dart';
import 'package:neura_chat/generated/l10n.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            S.of(context).Neura,
            style: AppStyles.styleSemiBold24(context),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: const WelcomViewBody(),
    );
  }
}
