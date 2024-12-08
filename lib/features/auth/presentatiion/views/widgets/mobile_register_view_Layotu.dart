import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/laoding_indicator.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/signup_cubit/sign_up_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/register_form.dart';

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
              showDialog(
                context: context,
                builder: (context) => LoadingIndicator(
                  inAsyncCall: state is SignUpLoadding ? true : false,
                ),
              );
              if (state is SignUpSuccess) {
                GoRouter.of(context).pushReplacement(AppRoutes.kWelcomView);
                popUpAlert(context: context, message: 'Created');
              }
              if (state is SignUpFailure) {
                popUpAlert(context: context, message: state.errorMessage);
              }
            },
            child: const RegisterForm(),
          ),
        ),
      ),
    );
  }
}
