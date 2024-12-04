import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_login_cubit/check_auth_status_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/login_view.dart';
import 'package:neura_chat/features/home/presentation/views/welcom_view.dart';

class CheckAuthStatusView extends StatelessWidget {
  const CheckAuthStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckAuthStatusCubit, CheckAuthStatusState>(
        builder: (context, state) {
          if (state is CheckAuthStatusStateSeen) {
            return const WelcomView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
