import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class MobileAlertPopUp extends StatelessWidget {
  const MobileAlertPopUp({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                  ? AppPalette.kLightScaffoldColor
                  : AppPalette.kSecondaryDarkColor,
            ),
            child: Center(
              child: Text(
                message,
                style: AppStyles.styleRegular15(context),
              ),
            ),
          );
        },
      ),
    );
  }
}
