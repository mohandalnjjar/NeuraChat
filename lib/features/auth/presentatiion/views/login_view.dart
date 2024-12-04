import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/login_bottom_nav_bar.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/login_view_body.dart';
import 'package:neura_chat/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authRepoImpl: AuthRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => GoogleLoginCubit(
            authRepoImpl: AuthRepoImpl(),
          ),
        )
      ],
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            onPressed: () {
              GoRouter.of(
                context,
              ).push(AppRoutes.kWelcomView);
            },
            icon: Text(
              S.of(context).Skip,
              style: AppStyles.styleGreyReg16(context),
            ),
          ),
        ]),
        body: const SafeArea(
          child: LoginViewBody(),
        ),
        bottomNavigationBar: const LoginButtomNavBar(),
      ),
    );
  }
}
