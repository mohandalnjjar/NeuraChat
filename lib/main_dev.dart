import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:neura_chat/core/services/app_router.dart';
import 'package:neura_chat/core/utils/functions/app_theme_data.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/fast_actions_bloc/fast_actions_bloc.dart';
import 'package:neura_chat/features/language/data/repos/language_repo_impl.dart';
import 'package:neura_chat/features/language/presentation/managers/language_cubit/language_cubit.dart';
import 'package:neura_chat/features/theme/data/repos/theme_repo_impl.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

import 'package:neura_chat/firebase_options_dev.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'Neura Chat dev',
  );

  final themeRepo = getIt.get<ThemeRepoImpl>();
  final themeCubit = ThemeCubit(themeRepo);
  await themeCubit.getTheme();
  runApp(
    NeuraChat(themeCubit: themeCubit),
  );
}

class NeuraChat extends StatelessWidget {
  final ThemeCubit themeCubit;

  const NeuraChat({super.key, required this.themeCubit});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: themeCubit,
        ),
        BlocProvider(
          create: (context) => LanguageCubit(
            languageRepoImpl: getIt.get<LanguageRepoImpl>(),
          )..getAppLanguage(context: context),
        ),
        BlocProvider(
          create: (context) => FastActionsBloc(
            homeRepoImpl: getIt.get<HomeRepoImpl>(),
          )..add(
              FetchFastActionsBlocEvent(
                currenLanguage:
                    BlocProvider.of<LanguageCubit>(context).currentLanguage,
              ),
            ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return MaterialApp.router(
                locale: Locale(
                  BlocProvider.of<LanguageCubit>(context).currentLanguage,
                ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                title: 'Neura',
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: appThemeData(
                  isDark: BlocProvider.of<ThemeCubit>(context).getThemeMode,
                  context: context,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
