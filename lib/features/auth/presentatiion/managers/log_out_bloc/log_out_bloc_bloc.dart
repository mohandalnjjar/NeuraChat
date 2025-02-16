import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo_impl.dart';

part 'log_out_bloc_event.dart';
part 'log_out_bloc_state.dart';

class LogOutBloc extends Bloc<LogOutBlocEvent, LogOutBlocState> {
  final AuthRepoImpl authRepoImpl;
  final InternetConnectivity internetConnectivity;

  LogOutBloc({
    required this.authRepoImpl,
    required this.internetConnectivity,
  }) : super(LogOutBlocInitial()) {
    on<LogOutBlocEvent>((event, emit) async {
      if (event is PerformLogOutBlocEvent) {
        emit(
          LogOutBlocLoading(),
        );

        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );

        bool isConnected = await internetConnectivity.isInternetAvailable();
        if (!isConnected) {
          emit(
            LogOutBlocFailed(
              errorMessage: 'No internet connection',
            ),
          );
          return;
        }
        var response = await authRepoImpl.logOut();

        response.fold(
          (failed) {
            emit(
              LogOutBlocFailed(errorMessage: failed.errorMessage),
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
