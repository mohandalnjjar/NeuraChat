part of 'delet_saved_chat_cubit.dart';

@immutable
sealed class DeletSavedChatState {}

final class DeletSavedChatInitial extends DeletSavedChatState {}

final class DeletSavedChatLoading extends DeletSavedChatState {}

final class DeletSavedChatSuccess extends DeletSavedChatState {}

final class DeletSavedChatFailed extends DeletSavedChatState {
  final String errorMessage;

  DeletSavedChatFailed({required this.errorMessage});
}
