import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1.3,
              child: BlocBuilder<ThemeCubit, ThemeCubitState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                          ? AppPalette.kSecondaryDarkColor
                          : AppPalette.kwhitModeMessageColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FeatherIcons.code,
                          color: Colors.cyanAccent,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Coding",
                          style: AppStyles.styleSemiBold17(context),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Spacer(),
                        Text(
                          "I can generate and or teach you the coding",
                          style: AppStyles.styleRegular14(context),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
