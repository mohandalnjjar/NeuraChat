import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'log_out_bloc_event.dart';
part 'log_out_bloc_state.dart';

class LogOutBloc extends Bloc<LogOutBlocEvent, LogOutBlocState> {
  final AuthRepoImpl authRepoImpl;
  LogOutBloc({required this.authRepoImpl}) : super(LogOutBlocInitial()) {
    on<LogOutBlocEvent>((event, emit) async {
      if (event is PerformLogOutBlocEvent) {
        emit(
          LogOutBlocLoading(),
        );
        var response = await authRepoImpl.logOut();

        response.fold(
          (fialed) {
            emit(
              LogOutBlocFailed(),
            );
          },
          (success) {
            emit(
              LogOutBlocSuccess(),
            );
          },
        );
      }
    });
  }
}
