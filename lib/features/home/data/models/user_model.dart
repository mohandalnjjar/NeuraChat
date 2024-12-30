import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neura_chat/features/home/data/models/genius_mode_model.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final GeniusModelModel geniusModelModel;
  final Timestamp createdAt;

  UserModel({
    required this.geniusModelModel,
    required this.userId,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserModel.fromFireBase(Map<String, dynamic>? data) {
    return UserModel(
      userId: data!['userId'],
      name: data['name'] ?? "I am Neura",
      email: data['email'],
      createdAt: data['createdAt'],
      geniusModelModel: data['customInstructions'] != null
          ? GeniusModelModel.fromFirebase(
              data: data['customInstructions'],
            )
          : GeniusModelModel(userInstuctions: '', responseMode: ''),
    );
  }
}
