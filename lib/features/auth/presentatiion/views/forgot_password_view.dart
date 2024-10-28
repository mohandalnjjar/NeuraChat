import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestPasswordCubit(
        AuthRepoImpl(),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            S.of(context).ForgotPassword,
            style: AppStyles.styleSemiBold27(context),
          ),
          centerTitle: true,
          leading: Center(
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 27,
              ),
            ),
          ),
        ),
        body: const ForgotPasswordViewBody(),
      ),
    );
  }
}
