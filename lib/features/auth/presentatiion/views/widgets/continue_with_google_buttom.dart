import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class ContinueWithGoogleButtom extends StatelessWidget {
  const ContinueWithGoogleButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await BlocProvider.of<GoogleLoginCubit>(context).googleAuthMethod();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesGoogleIcon,
            height: 25,
          ),
          const SizedBox(
            width: 13,
          ),
          Text(
            S.of(context).continueWithGoogle,
            style: AppStyles.styleBold17(context).copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
