import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/features/home/data/models/user_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';

part 'fetch_user_data_event.dart';
part 'fetch_user_data_state.dart';

class FetchUserDataBloc extends Bloc<UserDataEvent, FetchUserDataState> {
  final HomeRepoImpl homeRepoImpl;
  FetchUserDataBloc(this.homeRepoImpl) : super(FetchUserDataInitial()) {
    on<UserDataEvent>(
      (event, emit) async {
        if (event is FetchUserDataEvent) {
          emit(
            FetchUserDataLaoding(),
          );
          await for (final response in homeRepoImpl.fetchUserData()) {
            response.fold(
              (failed) {
                emit(
                  FetchUserDataFailed(errorMessage: failed.errorMessage),
                );
              },
              (success) {
                emit(
                  FetchUserDataSuccess(
                    userModel: success,
                  ),
                );
              },
            );
          }
        }
      },
    );
  }
}
