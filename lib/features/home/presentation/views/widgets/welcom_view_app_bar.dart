import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/widgets/auth_button.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_auth_state_bloc/check_auth_state_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_saved_chats_bloc/fetch_saved_chats_bloc.dart';
import 'package:neura_chat/generated/l10n.dart';

class WelcomViewAppBar extends StatelessWidget {
  const WelcomViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: const Icon(FeatherIcons.alignJustify),
      ),
      title: Text(
        S.of(context).Neura,
        style: AppStyles.styleSemiBold24(context),
      ),
      actions: [
        BlocBuilder<CheckAuthStateBloc, CheckAuthStateState>(
          builder: (context, state) {
            if (state is Authenticated) {
              BlocProvider.of<FetchSavedChatsBloc>(context).add(
                FetchIntialSavedChatsEvent(),
              );
              if (state.isanonymous) {
                return const AuthButton();
              } else {
                return const SizedBox();
              }
            } else {
              BlocProvider.of<FetchSavedChatsBloc>(context).add(
                FetchIntialSavedChatsEvent(),
              );
              return const AuthButton();
            }
          },
        ),
      ],
    );
  }
}
