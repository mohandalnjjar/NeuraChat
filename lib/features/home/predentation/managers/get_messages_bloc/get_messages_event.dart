part of 'get_messages_bloc.dart';

@immutable
sealed class GetMessagesEvent {}

class FetchMessagesEvent extends GetMessagesEvent {
  final String chatId;

  FetchMessagesEvent({
    required this.chatId,
  });
}
