import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'sign_in_anonymously_state.dart';

class SignInAnonymouslyCubit extends Cubit<SignInAnonymouslyState> {
  final AuthRepoImpl authRepoImpl;
  final InternetConnectivity internetConnectivity;

  SignInAnonymouslyCubit({
    required this.authRepoImpl,
    required this.internetConnectivity,
  }) : super(SignInAnonymouslyInitial());

  Future<void> signInAnonymouslyMethod() async {
    emit(
      SignInAnonymouslyLoading(),
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    bool isConnected = await internetConnectivity.isInternetAvailable();
    if (!isConnected) {
      emit(
        SignInAnonymouslyFailed(
          errorMessage: 'No internet connection',
        ),
      );
    } else {
      var res = await authRepoImpl.signInAnonymously();

      res.fold((faild) {
        emit(
          SignInAnonymouslyFailed(errorMessage: faild.errorMessage),
        );
      }, (success) {
        emit(
          SignInAnonymouslySuccess(),
        );
      });
    }
  }
}
