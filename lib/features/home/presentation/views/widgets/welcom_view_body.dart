import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/ask_me_buttom.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/fast_actions_list_view.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/welcom_header_section.dart';

class WelcomViewBody extends StatefulWidget {
  const WelcomViewBody({
    super.key,
  });

  @override
  State<WelcomViewBody> createState() => _WelcomViewBodyState();
}

class _WelcomViewBodyState extends State<WelcomViewBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        WelcomeHeaderSection(),
        Spacer(),
        FastActionsListView(),
        AskMeButton(),
      ],
    );
  }
}
