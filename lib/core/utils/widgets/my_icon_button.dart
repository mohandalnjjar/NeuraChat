import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        foregroundColor: BlocProvider.of<ThemeCubit>(context).getThemeMode
            ? AppPalette.kwhitModeMessageColor
            : AppPalette.kSecondaryDarkColor,
        backgroundColor: BlocProvider.of<ThemeCubit>(context).getThemeMode
            ? AppPalette.kSecondaryDarkColor
            : AppPalette.kwhitModeMessageColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
      ),
    );
  }
}
