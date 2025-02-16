import 'package:bloc/bloc.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.authRepoImpl,
    required this.internetConnectivity,
  }) : super(SignUpInitial());
  final AuthRepoImpl authRepoImpl;
  final InternetConnectivity internetConnectivity;

  Future<void> signUpMethod(
      {required String email,
      required String password,
      required String name}) async {
    emit(
      SignUpLoadding(),
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    bool isConnected = await internetConnectivity.isInternetAvailable();
    if (!isConnected) {
      emit(
        SignUpFailure(
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }

    var result = await authRepoImpl.singUpUserMethod(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(
        SignUpFailure(
          errorMessage: failure.errorMessage,
        ),
      ),
      (success) => emit(
        SignUpSuccess(),
      ),
    );
  }
}
