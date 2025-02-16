import 'package:bloc/bloc.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepoImpl,
    required this.internetConnectivity,
  }) : super(LoginInitial());
  final AuthRepoImpl authRepoImpl;
  final InternetConnectivity internetConnectivity;

  Future<void> loginMethod(
      {required String email, required String password}) async {
    emit(
      LoginLoadding(),
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    bool isConnected = await internetConnectivity.isInternetAvailable();
    if (!isConnected) {
      emit(
        LoginFailure(
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }

    var result =
        await authRepoImpl.loginUserMethod(email: email, password: password);
    result.fold(
      (failure) => emit(
        LoginFailure(
          errorMessage: failure.errorMessage,
        ),
      ),
      (success) => emit(
        LoginSuccess(),
      ),
    );
  }
}
