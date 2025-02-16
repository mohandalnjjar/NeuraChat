import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';

part 'update_user_data_event.dart';
part 'update_user_data_state.dart';

class UpdateUserDataBloc
    extends Bloc<UpdateUserDataEvent, UpdateUserDataState> {
  final HomeRepoImpl homeRepoImpl;

  final InternetConnectivity internetConnectivity;
  UpdateUserDataBloc({
    required this.homeRepoImpl,
    required this.internetConnectivity,
  }) : super(UpdateUserDataInitial()) {
    on<UpdateUserDataEvent>((event, emit) async {
      if (event is PerfromUpdateUserDataEvent) {
        emit(UpdateUserDataLoading());

        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );

        bool isConnected = await internetConnectivity.isInternetAvailable();
        if (!isConnected) {
          emit(
            UpdateUserDataFailed(
              errorMessage: 'No internet connection',
            ),
          );
          return;
        }

        var response = await homeRepoImpl.updateUserDetails(
          name: event.name,
          responseMode: event.responseMode,
          userInstuctions: event.userInstuctions,
        );
        response.fold(
          (failed) {
            emit(
              UpdateUserDataFailed(
                errorMessage: failed.errorMessage,
              ),
            );
          },
          (success) {
            emit(
              UpdateUserDataSuccess(),
            );
          },
        );
      }
    });
  }
}
