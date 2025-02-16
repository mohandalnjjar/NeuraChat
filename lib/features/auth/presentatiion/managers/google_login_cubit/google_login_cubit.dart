import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit({
    required this.authRepoImpl,
    required this.internetConnectivity,
  }) : super(GoogleLoginInitial());

  final AuthRepoImpl authRepoImpl;
  final InternetConnectivity internetConnectivity;
  Future<void> googleAuthMethod() async {
    emit(
      GoogleLoginLoading(),
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    bool isConnected = await internetConnectivity.isInternetAvailable();
    if (!isConnected) {
      emit(
        GoogleLoginFailed(
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }

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
