part of 'fetch_saved_chats_bloc.dart';

@immutable
sealed class FetchSavedChatsEvent {}

class FetchIntialSavedChatsEvent extends FetchSavedChatsEvent {}

class FetchSavedMoreChatsEvent extends FetchSavedChatsEvent {
  final SavedChatModel lastMessagel;

  FetchSavedMoreChatsEvent({required this.lastMessagel});
}
