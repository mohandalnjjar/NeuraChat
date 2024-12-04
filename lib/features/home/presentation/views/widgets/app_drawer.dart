import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: BlocBuilder<ThemeCubit, ThemeCubitState>(
          builder: (context, state) {
            return Column(
              children: [
                SwitchListTile(
                  contentPadding: const EdgeInsets.only(right: 10),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        BlocProvider.of<ThemeCubit>(context).themeMode
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: BlocProvider.of<ThemeCubit>(context).themeMode
                            ? Colors.white
                            : Colors.black,
                      ),
                      Text(
                        BlocProvider.of<ThemeCubit>(context).themeMode
                            ? "Dark mode"
                            : "light mode",
                        style: AppStyles.styleRegular18(context),
                      ),
                    ],
                  ),
                  value: BlocProvider.of<ThemeCubit>(context).themeMode,
                  onChanged: (value) async {
                    await BlocProvider.of<ThemeCubit>(context)
                        .changAppTheme(themeValue: value);
                  },
                ),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.kLanguageView);
                  },
                  icon: const Icon(Icons.lan),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
