import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_auth_state_bloc/check_auth_state_bloc.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/log_out_bloc/log_out_bloc_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/app_bar_item_widget.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/app_theme_dialog.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/login&out_bloc_button.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutBloc(
        authRepoImpl: getIt.get<AuthRepoImpl>(),
        internetConnectivity: getIt.get<InternetConnectivity>(),
      ),
      child: SafeArea(
        child: Drawer(
          child: BlocBuilder<ThemeCubit, ThemeCubitState>(
            builder: (context, state) {
              return Column(
                children: [
                  BlocBuilder<CheckAuthStateBloc, CheckAuthStateState>(
                    builder: (context, state) {
                      if (state is Authenticated && !state.isanonymous) {
                        return Column(
                          children: [
                            AppBarItemWidget(
                              leading: const Icon(
                                EvaIcons.flash,
                              ),
                              title: S.of(context).geniusMode,
                              onTap: () => GoRouter.of(context).push(
                                AppRoutes.kGeniusModeView,
                              ),
                            ),
                            AppBarItemWidget(
                              leading: const Icon(
                                FeatherIcons.layers,
                              ),
                              title: S.of(context).savedChats,
                              onTap: () => GoRouter.of(context)
                                  .push(AppRoutes.kSavedChatView),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  AppBarItemWidget(
                    leading: const Icon(
                      Ionicons.earth,
                    ),
                    title: S.of(context).language,
                    onTap: () =>
                        GoRouter.of(context).push(AppRoutes.kLanguageView),
                  ),
                  AppBarItemWidget(
                    title: S.of(context).theme,
                    leading: const Icon(
                      Ionicons.color_palette_sharp,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AppThemeDialog();
                        },
                      );
                    },
                  ),
                  const LogInAndLogOutBlocButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
