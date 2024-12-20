import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/functions/is_arabic.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/log_out_bloc/log_out_bloc_bloc.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(
        bottom: 14,
        right: isArabic() ? 0 : 14,
        top: 30,
        left: isArabic() ? 14 : 0,
      ),
      title: Text(
        "Are you sure Logout ?",
        style: AppStyles.styleRegular20(context),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () {
              BlocProvider.of<LogOutBloc>(context).add(
                PerformLogOutBlocEvent(),
              );
              context.pop();
            },
            child: Text(
              "LogOut",
              style: AppStyles.styleRegular15(context).copyWith(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppPalette.kWhitePrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Cancel",
              style: AppStyles.styleRegular15(context).copyWith(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
