import 'package:flutter/material.dart';
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
import 'package:neura_chat/features/auth/presentatiion/managers/signup_cubit/sign_up_cubit.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/continue_with_google_buttom.dart';
import 'package:neura_chat/features/auth/presentatiion/views/widgets/or_widget.dart';
import 'package:neura_chat/generated/l10n.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _nameControler = TextEditingController();
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();
  String? email, password;
  bool obscureText = true;

  @override
  void dispose() {
    _nameControler.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
    super.dispose();
  }

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
          alertPopUp(context: context, message: state.errorMessage);
        } else {
          GoRouter.of(context).push(AppRoutes.kChatView);

          alertPopUp(context: context, message: 'Done');
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign up to continue',
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
                controller: _nameControler,
                hint: S.of(context).UserName,
                validator: (value) {
                  return Validators.nameValidator(value);
                },
                prefixIcon: const Icon(FeatherIcons.user),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextFormField(
                onSaved: (value) {
                  email = value;
                },
                controller: _emailControler,
                validator: (value) {
                  return Validators.emailValidator(value);
                },
                hint: S.of(context).Email,
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
                validator: (value) {
                  return Validators.passwordValidator(value);
                },
                prefixIcon: const Icon(FeatherIcons.lock),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    FocusScope.of(context).unfocus();
                    await BlocProvider.of<SignUpCubit>(context).signUpMethod(
                      email: email!.trim(),
                      password: password!,
                      name: _nameControler.text,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: Text(
                  S.of(context).SingUp,
                  style: AppStyles.styleBold17(context).copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const OrWidget(),
              const ContinueWithGoogleButtom(),
            ],
          ),
        );
      },
    );
  }
}
