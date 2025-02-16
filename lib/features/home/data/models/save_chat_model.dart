import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';

class SavedChatModel {
  final String chatId;
  final Timestamp savedAt;
  final List<Message> messages;

  SavedChatModel({
    required this.chatId,
    required this.savedAt,
    required this.messages,
  });

  factory SavedChatModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> jsonData) {
    final messagesList = jsonData['messages'] as List<dynamic>;
    final messages =
        messagesList.map((msg) => Message.fromFireStore(msg)).toList();

    return SavedChatModel(
      chatId: jsonData['ChatId'],
      savedAt: jsonData['SavedAt'],
      messages: messages,
    );
  }
}
