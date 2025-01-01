import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/signIn_anonymously_cubit/sign_in_anonymously_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/login_bottom_nav_bar.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/login_view_body.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/sign_in_anonymously_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authRepoImpl: getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => GoogleLoginCubit(
            authRepoImpl: getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => SignInAnonymouslyCubit(
            authRepoImpl: getIt.get<AuthRepoImpl>(),
          ),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            SignInAnonymouslyButton(),
          ],
        ),
        body: const SafeArea(
          child: LoginViewBody(),
        ),
        bottomNavigationBar: const LoginButtomNavBar(),
      ),
    );
  }
}
