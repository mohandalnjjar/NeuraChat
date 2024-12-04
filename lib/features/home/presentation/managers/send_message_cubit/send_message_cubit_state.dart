abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageSentSuccess extends MessageState {}

class MessageSentFailure extends MessageState {
  final String errorMessage;

  MessageSentFailure({required this.errorMessage});
}
