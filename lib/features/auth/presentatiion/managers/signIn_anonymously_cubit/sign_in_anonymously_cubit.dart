import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'sign_in_anonymously_state.dart';

class SignInAnonymouslyCubit extends Cubit<SignInAnonymouslyState> {
  final AuthRepoImpl authRepoImpl;
  SignInAnonymouslyCubit({
    required this.authRepoImpl,
  }) : super(SignInAnonymouslyInitial());

  Future<void> signInAnonymouslyMethod() async {
    emit(
      SignInAnonymouslyLoading(),
    );
    var res = await authRepoImpl.signInAnonymously();

    res.fold((faild) {
      emit(
        SignInAnonymouslyFailed(),
      );
    }, (success) {
      emit(
        SignInAnonymouslySuccess(),
      );
    });
  }
}
