import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/delet_saved_chat_cubit/delet_saved_chat_cubit.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/delet_bloc_button.dart';
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
        return BlocProvider(
          create: (context) => DeletSavedChatCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
            internetConnectivity: getIt.get<InternetConnectivity>(),
          ),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRoutes.kChatView,
                extra: {
                  'savedChats': savedChatModel,
                  'initialValue': null,
                },
              );
            },
            child: BlocListener<DeletSavedChatCubit, DeletSavedChatState>(
              listener: (context, state) {
                if (state is DeletSavedChatFailed) {
                  popUpAlert(context: context, message: state.errorMessage);
                }
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
                            height: 5,
                          ),
                          Text(
                            savedChatModel.messages.isNotEmpty &&
                                    savedChatModel
                                        .messages[0].content.isNotEmpty
                                ? savedChatModel.messages[0].content
                                : 'No content available',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.styleGreyReg16(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DeletMessageBlocButton(savedChatModel: savedChatModel),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
