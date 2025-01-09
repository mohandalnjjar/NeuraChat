import 'package:neura_chat/features/home/data/models/message_model.dart';

abstract class SendMessageState {}

class MessageInitial extends SendMessageState {}

class MessageSentLoading extends SendMessageState {}

class MessageSentSuccess extends SendMessageState {
  final List<Message> messages;

  MessageSentSuccess({required this.messages});
}

class MessageSentFailure extends SendMessageState {
  final String errorMessage;

  MessageSentFailure({required this.errorMessage});
}
