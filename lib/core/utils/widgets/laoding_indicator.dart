import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    required this.inAsyncCall,
  });

  final bool inAsyncCall;

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: BlocProvider.of<ThemeCubit>(context).themeMode
                      ? AppPalette.kDarkScaffoldColor
                      : AppPalette.kLightScaffoldColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).Loading,
                      style: TextStyles.style700w16(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
