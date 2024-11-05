import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_loading_indicator.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/login_with_social_media_widget.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/or_widget.dart';

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
          builder: (context) => CustomLoadingIndicator(
            inAsyncCall: state is GoogleLoginLoading ? true : false,
          ),
        );
        if (state is GoogleLoginFailed) {
          context.pop();

          showedScaffoldMessage(context: context, message: state.errorMessage);
          context.pop();
        } else if (state is GoogleLoginDone) {
          context.pop();

          GoRouter.of(context).pushReplacement(RouterPath.kHomeViewRouter);

          showedScaffoldMessage(context: context, message: 'Done');
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
                CustomTextFromField(
                  onSaved: (value) {
                    email = value;
                  },
                  hint: 'Email',
                  validator: (value) {
                    return Validators.emailValidator(value);
                  },
                  prefixIcon: const Icon(IconlyLight.message),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFromField(
                  onSaved: (value) {
                    password = value;
                  },
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText
                          ? IconlyLight.shield_done
                          : IconlyLight.shield_fail,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  hint: 'Password',
                  prefixIcon: const Icon(IconlyLight.password),
                  validator: (value) {
                    return Validators.passwordValidator(value);
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () async {
                      await GoRouter.of(context)
                          .push(RouterPath.kForgotPasswordView);
                    },
                    child: Text(
                      'Forgot Password?',
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
                    'Login',
                    style: AppStyles.styleRegular18(context),
                  ),
                ),
                const OrWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginSocialMeadiWidget(
                      image: 'assets/images/google_icons.png',
                      onTap: () async {
                        await BlocProvider.of<GoogleLoginCubit>(context)
                            .googleAuthMethod();
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    LoginSocialMeadiWidget(
                      image: 'assets/images/facebook.png',
                      onTap: () async {
                        const CustomLoadingIndicator(
                          inAsyncCall: true,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
