part of 'fetch_saved_chats_bloc.dart';

@immutable
sealed class FetchSavedChatsState {}

final class FetchSavedChatsInitial extends FetchSavedChatsState {}

final class FetchSavedChatsLoading extends FetchSavedChatsState {}

final class FetchSavedChatsSuccess extends FetchSavedChatsState {
  final List<SavedChatModel> savedChats;

  FetchSavedChatsSuccess({required this.savedChats});
}

final class FetchSavedChatsFailed extends FetchSavedChatsState {
  final String errorMessage;

  FetchSavedChatsFailed({required this.errorMessage});
}
