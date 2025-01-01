import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

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
  final String messageId;

  Message({
    String? messageId,
    required this.isUser,
    required this.content,
  }) : messageId = messageId ?? const Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'isUser': isUser,
      'content': content,
      'messageId': messageId,
    };
  }

  factory Message.fromFireStore(Map<String, dynamic> jsonData) {
    return Message(
        isUser: jsonData['isUser'],
        content: jsonData['content'],
        messageId: jsonData['messageId']);
  }
}

class ChatMessageModel {
  final String chatId;
  final Timestamp createdAt;
  final Message message;

  ChatMessageModel({
    required this.chatId,
    required this.createdAt,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'createdAt': createdAt,
      'messages': [
        message.toMap(),
      ],
    };
  }

  factory ChatMessageModel.fromFireStore(Map<String, dynamic> jsonData) {
    return ChatMessageModel(
      chatId: jsonData['chatId'],
      createdAt: jsonData['createdAt'],
      message: Message.fromFireStore(jsonData['messages']),
    );
  }
}

class SavedChatModel {
  final String chatId;
  final Timestamp createdAt;
  final List<Message> messages;

  SavedChatModel({
    required this.chatId,
    required this.createdAt,
    required this.messages,
  });

  factory SavedChatModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> jsonData) {
    final messagesList = jsonData['messages'] as List<dynamic>;
    final messages =
        messagesList.map((msg) => Message.fromFireStore(msg)).toList();

    return SavedChatModel(
      chatId: jsonData['chatId'],
      createdAt: jsonData['createdAt'],
      messages: messages,
    );
  }
}
