import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class UserMessageWidget extends StatelessWidget {
  const UserMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                      ? AppPalette.kwhitModeMessageColor
                      : AppPalette.kwhitDarkMessageColor,
                ),
                child: Text(
                  "Hi",
                  style: AppStyles.styleRegular16(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
