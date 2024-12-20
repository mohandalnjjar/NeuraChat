import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/laoding_indicator.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/reset_password_cubit/rest_password_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/forgot_password_from.dart';
import 'package:neura_chat/generated/l10n.dart';

class MobileForgotPassswordBody extends StatelessWidget {
  const MobileForgotPassswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: BlocConsumer<RestPasswordCubit, RestPasswordState>(
        listener: (context, state) {
          if (state is RestPasswordLoading) {
            showDialog(
              context: context,
              builder: (context) => const LoadingIndicator(
                absorbing: true,
              ),
            );
          }
          if (state is RestPasswordFailed) {
            Navigator.of(context).pop();
            popUpAlert(context: context, message: state.errorMessage);
            Navigator.of(context).pop();
          } else if (state is RestPasswordDone) {
            Navigator.of(context).pop();

            popUpAlert(
              context: context,
              message: S.of(context).checkYourEmail,
            );

            GoRouter.of(context).pushReplacement(
              AppRoutes.kLoginView,
            );
          }
        },
        builder: (context, state) {
          return const ForGotPasswordFrom();
        },
      ),
    );
  }
}
