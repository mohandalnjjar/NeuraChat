import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class SavedChatWidget extends StatelessWidget {
  const SavedChatWidget({
    super.key,
    required this.savedChatModel,
  });
  final SavedChatModel savedChatModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRoutes.kChatView,
              extra: {
                'savedChats': savedChatModel,
                'initialValue': null,
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: AppPadding.globalPadding,
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                  ? AppPalette.kSecondaryDarkColor
                  : AppPalette.kwhitModeMessageColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        savedChatModel.messages.first.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleBold18(context),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        savedChatModel.messages.first.messageId,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleRegularGrey16(context),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
