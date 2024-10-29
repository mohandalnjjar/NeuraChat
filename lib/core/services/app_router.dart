import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/features/home/home.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kMainView,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}
