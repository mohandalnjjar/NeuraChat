import 'package:bloc/bloc.dart';
import 'package:swift_mart/features/auth/data/repos/auth_repo_impl.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepoImpl}) : super(SignUpInitial());
  final AuthRepoImpl authRepoImpl;
  Future<void> signUpMethod(
      {required String email,
      required String password,
      required String name}) async {
    emit(
      SignUpLoadding(),
    );

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
