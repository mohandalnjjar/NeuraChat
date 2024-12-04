import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/quick_actions_list_view.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),

        const WelcomeHeaderSection(),
        const Spacer(),
        // const NavigationHeader(
        //   title: 'Last Activities',
        //   viewRouter: AppRoutes.kSavedChatView,
        // ),

        Padding(
          padding: AppPadding.globalPadding,
          child: Text(
            "generate",
            style: AppStyles.styleGreyReg16(context),
          ),
        ),

        const QuickActionsListView(),
        Padding(
          padding: AppPadding.globalPadding,
          child: ElevatedButton(
            onPressed: () async {
              await GoRouter.of(context).push(AppRoutes.kChatView);
            },
            child: const Text(
              "Ask Me Any Thing",
            ),
          ),
        ),
      ],
    );
  }
}
