import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';

part 'delet_saved_chat_state.dart';

class DeletSavedChatCubit extends Cubit<DeletSavedChatState> {
  final HomeRepo homeRepo;
  final InternetConnectivity internetConnectivity;

  DeletSavedChatCubit({
    required this.homeRepo,
    required this.internetConnectivity,
  }) : super(DeletSavedChatInitial());

  Future<void> deletMethod(String chatId) async {
    emit(
      DeletSavedChatLoading(),
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    bool isConnected = await internetConnectivity.isInternetAvailable();
    if (!isConnected) {
      emit(
        DeletSavedChatFailed(
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }
    var response = await homeRepo.deletSavedChat(chatId: chatId);

    response.fold((failed) {
      emit(
        DeletSavedChatFailed(errorMessage: failed.errorMessage),
      );
    }, (success) {
      emit(
        DeletSavedChatSuccess(),
      );
    });
  }
}
