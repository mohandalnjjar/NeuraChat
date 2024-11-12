import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'check_auth_status_state.dart';

class CheckAuthStatusCubit extends Cubit<CheckAuthStatusState> {
  CheckAuthStatusCubit({required this.authRepoImpl})
      : super(CheckAuthStatusStateInitial());

  final AuthRepoImpl authRepoImpl;

  Future<void> checkAuthStatus() async {
    final isSeen = await authRepoImpl.getAuthStatus();
    print("Auth Status: $isSeen"); // Debugging line

    if (isSeen) {
      emit(
        CheckAuthStatusStateSeen(),
      );
    } else {
      emit(
        CheckAuthStatusStateNotSeen(),
      );
      await authRepoImpl.setAuthStatues();
    }
  }
}
