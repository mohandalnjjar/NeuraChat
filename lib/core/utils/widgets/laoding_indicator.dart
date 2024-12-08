import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    required this.inAsyncCall,
    this.absorbing = true,
  });

  final bool inAsyncCall;
  final bool absorbing;

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: absorbing,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<ThemeCubit, ThemeCubitState>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: BlocProvider.of<ThemeCubit>(context).themeMode
                            ? AppPalette.kDarkScaffoldColor
                            : AppPalette.kLightScaffoldColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Lottie.asset(
                            Assets.imagesLottieYaHabibi,
                            height: 88,
                          ),
                          Text(
                            S.of(context).loading,
                            style: AppStyles.style700w16(context),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
