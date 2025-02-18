import 'package:dartz/dartz.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
import 'package:neura_chat/features/home/data/models/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, MessageModel>> sendMessage(
      {required String userMessage});

  Stream<Either<Failures, UserModel>> fetchUserData();

  Future<Either<Failures, void>> updateUserDetails({
    required String? name,
  });

  Future<Either<Failures, void>> saveChat({
    required List<Message> messages,
    String? chatid,
  });

  Future<Either<Failures, List<SavedChatModel>>> fetchInitialSavedChats();
  Future<Either<Failures, List<SavedChatModel>>> fetchMoreSavedChats(
    SavedChatModel lastMessage,
  );

  Future<Either<Failures, void>> deletSavedChat({
    required String chatId,
  });
  Future<Either<Failures, List<FastActionModel>>> fetchFastActions({
    required String currentLang,
  });
}
