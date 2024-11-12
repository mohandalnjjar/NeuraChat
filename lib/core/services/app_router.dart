import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/features/auth/presentatiion/views/check_auth_status_view.dart';
import 'package:neura_chat/features/auth/presentatiion/views/forgot_password_view.dart';
import 'package:neura_chat/features/auth/presentatiion/views/login_view.dart';
import 'package:neura_chat/features/auth/presentatiion/views/sing_up.dart';
import 'package:neura_chat/features/home/predentation/views/chat_view.dart';
import 'package:neura_chat/features/language/presentation/views/language_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kMainView,
        builder: (context, state) => const CheckAuthStatusView(),
      ),
      GoRoute(
        path: AppRoutes.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.kChatView,
        builder: (context, state) => const ChatView(),
      ),
      GoRoute(
        path: AppRoutes.kLanguageView,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.kForgetPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
  );
}
