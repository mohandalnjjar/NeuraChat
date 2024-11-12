import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:neura_chat/core/services/app_router.dart';
import 'package:neura_chat/core/utils/functions/app_theme_data.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_login_cubit/check_auth_status_cubit.dart';
import 'package:neura_chat/features/language/data/repos/language_repo_impl.dart';
import 'package:neura_chat/features/language/presentation/managers/language_cubit/language_cubit.dart';
import 'package:neura_chat/features/theme/data/repos/theme_repo_impl.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';
import 'package:neura_chat/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'Neura Chat',
  );

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
          create: (context) => ThemeCubit(
            ThemeRepoImpl(),
          )..getTheme(context: context),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(
            languageRepoImpl: LanguageRepoImpl(),
          )..getAppLanguage(context: context),
        ),
        BlocProvider(
          create: (context) => CheckAuthStatusCubit(
            authRepoImpl: AuthRepoImpl(),
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
                title: 'Neura Chat',
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: appThemeData(
                  isDark: !!!BlocProvider.of<ThemeCubit>(context).themeMode,
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
