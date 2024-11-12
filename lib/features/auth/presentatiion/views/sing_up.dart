import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/signup_cubit/sign_up_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(
            authRepoImpl: AuthRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => GoogleLoginCubit(
            authRepoImpl: AuthRepoImpl(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: const SafeArea(
          child: SignUpViewBody(),
        ),
      ),
    );
  }
}

