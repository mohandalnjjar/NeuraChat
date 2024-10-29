import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/services/app_router.dart';
import 'package:neura_chat/core/utils/functions/app_theme_data.dart';
import 'package:neura_chat/features/theme/data/repos/theme_repo_impl.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

void main(List<String> args) {
  runApp(
    const NeuraChat(),
  );
}

class NeuraChat extends StatelessWidget {
  const NeuraChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ThemeCubit(ThemeRepoImpl())..getTheme(context: context),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Neura Chat',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: appThemeData(
              isDark: !BlocProvider.of<ThemeCubit>(context).themeMode,
              context: context,
            ),
          );
        },
      ),
    );
  }
}
