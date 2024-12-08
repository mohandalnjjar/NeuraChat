import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'check_auth_state_event.dart';
part 'check_auth_state_state.dart';

class CheckAuthStateBloc
    extends Bloc<CheckAuthStateEvent, CheckAuthStateState> {
  final AuthRepoImpl authRepoImpl;

  CheckAuthStateBloc({required this.authRepoImpl})
      : super(CheckAuthStateInitial()) {
    on<CheckAuthStateEvent>((event, emit) async {
      if (event is PerformCheckAuthEvent) {
        await for (var response in authRepoImpl.checkAuthState()) {
          response.fold(
            (filed) {
              emit(
                Unauthenticated(
                  authMessage: filed.errorMessage,
                ),
              );
            },
            (success) {
              emit(
                Authenticated(isanonymous: success),
              );
            },
          );
        }
      }
    });
  }
}
