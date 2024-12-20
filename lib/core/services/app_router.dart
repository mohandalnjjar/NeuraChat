import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/auth/presentatiion/views/check_auth_status_view.dart';
import 'package:neura_chat/features/auth/presentatiion/views/forgot_password_view.dart';
import 'package:neura_chat/features/auth/presentatiion/views/login_view.dart';
import 'package:neura_chat/features/auth/presentatiion/views/sign_up.dart';
import 'package:neura_chat/features/home/presentation/views/chat_view.dart';
import 'package:neura_chat/features/home/presentation/views/details_genius_mode_view.dart';
import 'package:neura_chat/features/home/presentation/views/geniues_mode_view.dart';
import 'package:neura_chat/features/home/presentation/views/welcom_view.dart';
import 'package:neura_chat/features/language/presentation/views/language_view.dart';
import 'package:neura_chat/features/saved_chats/presentation/views/saved_chat_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kCheckAuthStatusView,
        builder: (context, state) => const CheckAuthStatusView(),
      ),
      GoRoute(
        path: AppRoutes.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.kChatView,
        builder: (context, state) => ChatView(
          initialValue: state.extra as String?,
        ),
      ),
      GoRoute(
        path: AppRoutes.kLanguageView,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.kForgetPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.kWelcomView,
        builder: (context, state) => const WelcomView(),
      ),
      GoRoute(
        path: AppRoutes.kSavedChatView,
        builder: (context, state) => const SavedChatView(),
      ),
      GoRoute(
        path: AppRoutes.kGeniusModeView,
        builder: (context, state) => const GeniuesModeView(),
      ),
      GoRoute(
        path: AppRoutes.kDetailsGeniusModeView,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final title = args['title'] as String;
          final geniusMode = args['geniusMode'] as GeniusMode;
          return DetailsGeniusModeView(
            headTitle: title,
            geniusMode: geniusMode,
          );
        },
      ),
    ],
  );
}
