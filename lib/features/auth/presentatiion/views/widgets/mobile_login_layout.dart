import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/laoding_indicator.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/login_form.dart';
import 'package:neura_chat/generated/l10n.dart';

class MobileLoginLayout extends StatelessWidget {
  const MobileLoginLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: Center(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadding) {
              showDialog(
                context: context,
                builder: (context) => const LoadingIndicator(
                  absorbing: true,
                ),
              );
            } else if (state is LoginSuccess) {
              Navigator.of(context).pop();
              GoRouter.of(context).pushReplacement(AppRoutes.kWelcomView);
              popUpAlert(context: context, message: S.of(context).Success);
            } else if (state is LoginFailure) {
              context.pop();
              popUpAlert(context: context, message: state.errorMessage);
              context.pop();
            }
          },
          builder: (context, state) {
            return const LoginForm();
          },
        ),
      ),
    );
  }
}
