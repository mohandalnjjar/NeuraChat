import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/app_drawer.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/welcom_view_app_bar.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/welcom_view_body.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: WelcomViewAppBar(),
      ),
      drawer: AppDrawer(),
      body: WelcomViewBody(),
    );
  }
}
