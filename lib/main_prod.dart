import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:neura_chat/core/services/app_router.dart';
import 'package:neura_chat/core/utils/functions/app_theme_data.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_auth_state_bloc/check_auth_state_bloc.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/fast_actions_bloc/fast_actions_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_user_data_bloc/fetch_user_data_bloc.dart';
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

  setupServiceLocator();

  //ThemeCubit
  final themeCubit = ThemeCubit(getIt.get<ThemeRepoImpl>());
  await themeCubit.getTheme();
  //CheckAuthBloc
  final authBloc = CheckAuthStateBloc(authRepoImpl: getIt.get<AuthRepoImpl>());
  authBloc.add(PerformCheckAuthEvent());

  runApp(
    NeuraChat(
      themeCubit: themeCubit,
      authBloc: authBloc,
    ),
  );
}

class NeuraChat extends StatelessWidget {
  final ThemeCubit themeCubit;
  final CheckAuthStateBloc authBloc;

  const NeuraChat({
    super.key,
    required this.themeCubit,
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: authBloc,
        ),
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
        BlocProvider(
          create: (context) => FetchUserDataBloc(
            getIt.get<HomeRepoImpl>(),
          )..add(
              FetchUserDataEvent(),
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
