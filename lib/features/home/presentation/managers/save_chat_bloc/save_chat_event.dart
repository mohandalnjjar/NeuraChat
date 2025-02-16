part of 'save_chat_bloc.dart';

@immutable
sealed class SaveChatEvent {}

class PerformSaveChatEvent extends SaveChatEvent {
  final List<Message> messages;

  PerformSaveChatEvent({required this.messages});
}
