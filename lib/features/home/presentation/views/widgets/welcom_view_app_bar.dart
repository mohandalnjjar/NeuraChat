import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/widgets/auth_button.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_auth_state_bloc/check_auth_state_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/user_image_widget.dart';
import 'package:neura_chat/generated/l10n.dart';

class WelcomViewAppBar extends StatelessWidget {
  const WelcomViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
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
        actions: [
          BlocBuilder<CheckAuthStateBloc, CheckAuthStateState>(
            builder: (context, state) {
              if (state is Authenticated) {
                if (state.isanonymous) {
                  return const AuthButton();
                } else {
                  return const SizedBox();
                }
              } else {
                return const AuthButton();
              }
            },
          ),
        ],
      ),
    );
  }
}
