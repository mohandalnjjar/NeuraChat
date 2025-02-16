class MessageModel {
  final String message;
  final String modelVersion;

  MessageModel({
    required this.modelVersion,
    required this.message,
  });

  factory MessageModel.fromJson({required Map<String, dynamic> jsonData}) {
    return MessageModel(
      message: jsonData['candidates'][0]['content']['parts'][0]['text'],
      modelVersion: jsonData['modelVersion'],
    );
  }
}

class Message {
  final bool isUser;
  final String content;

  Message({
    required this.isUser,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'isUser': isUser,
      'content': content,
    };
  }

  factory Message.fromFireStore(jsonData) {
    return Message(
      isUser: jsonData['isUser'],
      content: jsonData['content'],
    );
  }
}
