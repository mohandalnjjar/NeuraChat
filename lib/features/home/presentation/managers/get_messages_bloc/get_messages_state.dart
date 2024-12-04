part of 'get_messages_bloc.dart';

@immutable
sealed class GetMessagesState {}

final class GetMessagesInitial extends GetMessagesState {}

final class GetMessagesloading extends GetMessagesState {}

final class GetMessagesSuccess extends GetMessagesState {
  final List<Message> messagesList;

  GetMessagesSuccess({required this.messagesList});
}

final class GetMessagesFailed extends GetMessagesState {
  final String errorMessage;

  GetMessagesFailed({required this.errorMessage});
}
