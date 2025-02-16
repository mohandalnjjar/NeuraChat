import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  RestPasswordCubit({
    required this.authRepoImpl,
    required this.internetConnectivity,
  }) : super(RestPasswordInitial());
  final AuthRepoImpl authRepoImpl;
  final InternetConnectivity internetConnectivity;

  Future<void> resetPasswordMethod({required email}) async {
    emit(RestPasswordLoading());

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    bool isConnected = await internetConnectivity.isInternetAvailable();
    if (!isConnected) {
      emit(
        RestPasswordFailed(
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }
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
