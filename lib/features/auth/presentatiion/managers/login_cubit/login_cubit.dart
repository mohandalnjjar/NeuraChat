import 'package:bloc/bloc.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepoImpl}) : super(LoginInitial());
  final AuthRepoImpl authRepoImpl;

  Future<void> loginMethod(
      {required String email, required String password}) async {
    emit(
      LoginLoadding(),
    );

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
