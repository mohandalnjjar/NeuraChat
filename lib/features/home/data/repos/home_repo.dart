import 'package:dartz/dartz.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/models/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<FastActionModel>>> fetchFastActions(
      {required String currentLang});
  Future<Either<Failures, MessageModel>> sendMessage(
      {required String userMessage});

  Stream<Either<Failures, UserModel>> fetchUserData();

  Future<Either<Failures, void>> uploadMessageToFirebase({
    required ChatMessageModel chatMessageModel,
  });

  Stream<Either<Failures, List<Message>>> fetchStreamMessages({
    required String chatId,
  });

  Future<Either<Failures, void>> updateUserDetails({
    required String? name,
  });
}
