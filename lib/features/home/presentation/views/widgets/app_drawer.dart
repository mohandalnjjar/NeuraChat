import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/log_out_bloc/log_out_bloc_bloc.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/get_genius_mode_instructions_bloc/get_genius_mode_instructions_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/genius_mode_view.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/app_bar_item_widget.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/app_theme_dialog.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutBloc(
        authRepoImpl: AuthRepoImpl(),
      ),
      child: SafeArea(
        child: Drawer(
          child: BlocBuilder<ThemeCubit, ThemeCubitState>(
            builder: (context, state) {
              return Column(
                children: [
                  AppBarItemWidget(
                    leading: const Icon(
                      EvaIcons.flash,
                    ),
                    title: 'Genius Mode',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BlocProvider<GetGeniusModeInstructionsBloc>(
                            create: (context) => GetGeniusModeInstructionsBloc(
                              HomeRepoImpl(),
                            )..add(
                                PerformGetGeniusModeInstructionsEvent(),
                              ),
                            child: const GeniuesModeView(),
                          ),
                        ),
                      );
                    },
                  ),
                  AppBarItemWidget(
                    leading: const Icon(
                      FeatherIcons.layers,
                    ),
                    title: 'Saved Chats',
                    onTap: () =>
                        GoRouter.of(context).push(AppRoutes.kSavedChatView),
                  ),
                  AppBarItemWidget(
                    leading: const Icon(
                      Ionicons.earth,
                    ),
                    title: 'Language',
                    onTap: () =>
                        GoRouter.of(context).push(AppRoutes.kLanguageView),
                  ),
                  AppBarItemWidget(
                    leading: const Icon(
                      Ionicons.color_palette_sharp,
                    ),
                    title: 'theme',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AppThemeDialog();
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ListTile(
                      leading: const Icon(
                        FeatherIcons.logOut,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Logout',
                        style: AppStyles.styleSemiBold20(context).copyWith(
                          color: Colors.red,
                        ),
                      ),
                      onTap: () => BlocProvider.of<LogOutBloc>(context).add(
                        PerformLogOutBlocEvent(),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
