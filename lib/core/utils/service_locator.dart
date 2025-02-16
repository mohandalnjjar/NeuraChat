import 'package:get_it/get_it.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/language/data/repos/language_repo_impl.dart';
import 'package:neura_chat/features/theme/data/repos/theme_repo_impl.dart';

final getIt = GetIt.instance;

//Dependancy injection controlle Area

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<LanguageRepoImpl>(LanguageRepoImpl());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<ThemeRepoImpl>(ThemeRepoImpl());

// Register services
  getIt.registerLazySingleton<InternetConnectivity>(() => InternetConnectivity());
}
