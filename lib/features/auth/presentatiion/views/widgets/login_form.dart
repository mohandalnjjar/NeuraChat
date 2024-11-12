import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/functions/validators.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/laoding_indicator.dart';
import 'package:neura_chat/core/utils/widgets/my_text_form_field.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/continue_with_google_buttom.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/or_widget.dart';
import 'package:neura_chat/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool obscureText = true;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleLoginCubit, GoogleLoginState>(
      listener: (context, state) {
        showDialog(
          context: context,
          builder: (context) => LoadingIndicator(
            inAsyncCall: state is GoogleLoginLoading ? true : false,
          ),
        );
        if (state is GoogleLoginFailed) {
          context.pop();

          alertPopUp(context: context, message: state.errorMessage);
          context.pop();
        } else if (state is GoogleLoginDone) {
          context.pop();

          GoRouter.of(context).pushReplacement(AppRoutes.kChatView);

          alertPopUp(context: context, message: 'Done');
          context.pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcom back !',
                  style: AppStyles.styleSemiBold27(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Please enter your detials',
                  style: AppStyles.styleGreyReg16(context),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextFormField(
                  onSaved: (value) {
                    email = value;
                  },
                  hint: S.of(context).Email,
                  validator: (value) {
                    return Validators.emailValidator(value);
                  },
                  prefixIcon: const Icon(FeatherIcons.mail),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                  onSaved: (value) {
                    password = value;
                  },
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? FeatherIcons.eye : FeatherIcons.eyeOff,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  hint: S.of(context).Password,
                  prefixIcon: const Icon(FeatherIcons.lock),
                  validator: (value) {
                    return Validators.passwordValidator(value);
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () async {
                      await GoRouter.of(context)
                          .push(AppRoutes.kForgetPasswordView);
                    },
                    child: Text(
                      S.of(context).ForgotPassword,
                      style: AppStyles.styleRegular15(context)
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      FocusScope.of(context).unfocus();
                      await BlocProvider.of<LoginCubit>(context).loginMethod(
                        email: email!,
                        password: password!,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  child: Text(
                    S.of(context).login,
                    style: AppStyles.styleBold17(context).copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                const OrWidget(),
                const ContinueWithGoogleButtom(),
              ],
            ),
          ),
        );
      },
    );
  }
}
