import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/laoding_indicator.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/signup_cubit/sign_up_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/sign_up.dart';
import 'package:neura_chat/generated/l10n.dart';

class MobileRegisterViewLayotu extends StatelessWidget {
  const MobileRegisterViewLayotu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppPadding.globalPadding,
        child: SingleChildScrollView(
          child: BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpLoadding) {
                showDialog(
                  context: context,
                  builder: (context) => const LoadingIndicator(
                    absorbing: true,
                  ),
                );
              }
              if (state is SignUpSuccess) {
                Navigator.of(context).pop();
                GoRouter.of(context).pushReplacement(AppRoutes.kWelcomView);
                popUpAlert(context: context, message: S.of(context).Success);
              }
              if (state is SignUpFailure) {
                Navigator.of(context).pop();
                popUpAlert(context: context, message: state.errorMessage);
                Navigator.of(context).pop();
              }
            },
            child: const SignUPForm(),
          ),
        ),
      ),
    );
  }
}
