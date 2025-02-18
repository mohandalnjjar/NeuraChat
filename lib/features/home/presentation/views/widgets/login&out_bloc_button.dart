import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_auth_state_bloc/check_auth_state_bloc.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/log_out_bloc/log_out_bloc_bloc.dart';
import 'package:neura_chat/generated/l10n.dart';

class LogInAndLogOutBlocButton extends StatelessWidget {
  const LogInAndLogOutBlocButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckAuthStateBloc, CheckAuthStateState>(
      builder: (context, state) {
        if (state is Authenticated && !state.isanonymous) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                FeatherIcons.logOut,
                color: Colors.red,
              ),
              title: Text(
                S.of(context).logOut,
                style: AppStyles.styleSemiBold20(context).copyWith(
                  color: Colors.red,
                ),
              ),
              onTap: () => BlocProvider.of<LogOutBloc>(context).add(
                PerformLogOutBlocEvent(),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                FeatherIcons.logIn,
              ),
              title: Text(
                'Login',
                style: AppStyles.styleSemiBold20(context),
              ),
              onTap: () =>
                  GoRouter.of(context).pushReplacement(AppRoutes.kLoginView),
            ),
          );
        }
      },
    );
  }
}
