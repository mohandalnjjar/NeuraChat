part of 'save_chat_bloc.dart';

@immutable
sealed class SaveChatState {}

final class SaveChatInitial extends SaveChatState {}

final class SaveChatLoading extends SaveChatState {}

final class SaveChatSucess extends SaveChatState {}

final class SaveChatFailed extends SaveChatState {
  final String errorMessage;

  SaveChatFailed({required this.errorMessage});
}
