import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/functions/validators.dart';
import 'package:neura_chat/core/utils/widgets/my_text_form_field.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/reset_password_cubit/rest_password_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class ForGotPasswordFrom extends StatefulWidget {
  const ForGotPasswordFrom({
    super.key,
  });

  @override
  State<ForGotPasswordFrom> createState() => _ForGotPasswordFromState();
}

class _ForGotPasswordFromState extends State<ForGotPasswordFrom> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).enterYourEmail,
            style: AppStyles.styleSemiBold27(context),
          ),
          Text(
            S.of(context).neuraChat,
            style: AppStyles.styleSemiBold27(context),
          ),
          const SizedBox(
            height: 16,
          ),
          MyTextFormField(
            onSaved: (value) {
              email = value;
            },
            hint: S.of(context).enterYourEmail,
            validator: (value) {
              return Validators.emailValidator(value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                FocusScope.of(context).unfocus();
                BlocProvider.of<RestPasswordCubit>(context)
                    .resetPasswordMethod(email: email);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            child: Text(
              S.of(context).resetPassword,
              style:
                  AppStyles.styleBold17(context).copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
