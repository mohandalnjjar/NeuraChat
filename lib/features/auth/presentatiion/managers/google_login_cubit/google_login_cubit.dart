import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/auth/data/repos/auth_repo_impl.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit({required this.authRepoImpl}) : super(GoogleLoginInitial());

  final AuthRepoImpl authRepoImpl;
  Future<void> googleAuthMethod() async {
    emit(
      GoogleLoginLoading(),
    );
    var result = await authRepoImpl.googleLogin();

    result.fold(
      (failed) => emit(
        GoogleLoginFailed(
          errorMessage: failed.errorMessage,
        ),
      ),
      (done) => emit(
        GoogleLoginDone(),
      ),
    );
  }
}
