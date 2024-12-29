import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final Map<String, dynamic> userInstructions;
  final Timestamp createdAt;

  UserModel({
    required this.userInstructions,
    required this.userId,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserModel.fromFireBase(Map<String, dynamic>? data) {
    return UserModel(
      userId: data!['userId'],
      name: data['name'],
      email: data['email'],
      createdAt: data['createdAt'],
      userInstructions: data['userInstructions'] ?? {},
    );
  }
}
