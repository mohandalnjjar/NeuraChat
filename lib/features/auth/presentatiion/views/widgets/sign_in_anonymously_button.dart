import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/laoding_indicator.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/signIn_anonymously_cubit/sign_in_anonymously_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class SignInAnonymouslyButton extends StatelessWidget {
  const SignInAnonymouslyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInAnonymouslyCubit, SignInAnonymouslyState>(
      listener: (context, state) {
        if (state is SignInAnonymouslyLoading) {
          showDialog(
            context: context,
            builder: (context) => const LoadingIndicator(
              absorbing: true,
            ),
          );
        } else if (state is SignInAnonymouslySuccess) {
          GoRouter.of(context).pushReplacement(AppRoutes.kWelcomView);
          popUpAlert(context: context, message: S.of(context).Success);
        } else if (state is SignInAnonymouslyFailed) {
          popUpAlert(context: context, message: state.errorMessage);
          Navigator.of(context).pop();
        }
      },
      child: TextButton(
        onPressed: () async {
          await BlocProvider.of<SignInAnonymouslyCubit>(context)
              .signInAnonymouslyMethod();
        },
        child: Text(
          S.of(context).Skip,
          style: AppStyles.styleGreyReg16(context),
        ),
      ),
    );
  }
}
