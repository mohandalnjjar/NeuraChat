import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  RestPasswordCubit(this.authRepoImpl) : super(RestPasswordInitial());
  final AuthRepoImpl authRepoImpl;

  Future<void> resetPasswordMethod({required email}) async {
    emit(RestPasswordLoading());
    var result = await authRepoImpl.resetPasswordMethod(email: email);

    result.fold(
      (failed) => emit(RestPasswordFailed(
        errorMessage: failed.errorMessage,
      )),
      (done) => emit(
        RestPasswordDone(),
      ),
    );
  }
}
