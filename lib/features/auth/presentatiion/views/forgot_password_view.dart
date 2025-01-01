import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/core/utils/widgets/my_icon_button.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/reset_password_cubit/rest_password_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestPasswordCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Center(
            child: MyIconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              onPressed: () => GoRouter.of(context).pop(),
            ),
          ),
        ),
        body: const ForgotPasswordViewBody(),
      ),
    );
  }
}
