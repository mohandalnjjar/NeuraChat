abstract class SendMessageState {}

class MessageInitial extends SendMessageState {}

class MessageLoading extends SendMessageState {}

class MessageSentSuccess extends SendMessageState {}

class MessageSentFailure extends SendMessageState {
  final String errorMessage;

  MessageSentFailure({required this.errorMessage});
}
