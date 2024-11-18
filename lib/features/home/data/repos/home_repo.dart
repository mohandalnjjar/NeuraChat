import 'package:dartz/dartz.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, MessageModel>> sendMessage({required String message});

  Future<Either<Failures, void>> uploadMessageToFirebase({
    required ChatMessageModel chatMessageModel,
  });

  Stream<Either<Failures, List<Message>>> fetchStreamMessages({
    required String chatId,
  });
}
