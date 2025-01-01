part of 'fetch_saved_chats_bloc.dart';

@immutable
sealed class FetchSavedChatsEvent {}

class PerformFetchSavedChatsEvent extends FetchSavedChatsEvent {}
