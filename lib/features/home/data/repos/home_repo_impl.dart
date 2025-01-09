import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/core/services/api_services.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/models/user_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';
import 'package:uuid/uuid.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices = ApiServices();
  final Uuid uuid = const Uuid();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final List<Map<String, dynamic>> messageHistory = [];

  @override
  Future<Either<Failures, MessageModel>> sendMessage({
    required String userMessage,
  }) async {
    final User? user = auth.currentUser;
    if (user == null) {
      return left(
        ServerFailure(errorMessage: 'User not authenticated.'),
      );
    }
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final Map<String, dynamic> customInstructions =
          (userDoc.data() as Map<String, dynamic>?)?['customInstructions'] ??
              {};

      if (messageHistory.isEmpty) {
        messageHistory.add(
          {
            "role": "developer",
            "parts": [
              {"text": "My Details:\n${customInstructions.toString()}"},
              {"text": "if the user ask about your name answer with Neura"},
            ],
          },
        );
      }
      messageHistory.add(
        {
          "role": "user",
          "parts": [
            {"text": userMessage},
          ],
        },
      );

      var response = await apiServices.post(
        url:
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent',
        body: {
          "contents": messageHistory,
        },
        apiKey: 'AIzaSyCECyK_KdAvVAW8S0KCFCPK-mSGXiUhtes',
        contentType: Headers.jsonContentType,
      );

      messageHistory.add(
        {
          "role": "model",
          "parts": [
            {
              "text": response.data['candidates'][0]['content']['parts'][0]
                  ['text']
            },
          ],
        },
      );
      return right(
        MessageModel.fromJson(
          jsonData: response.data,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(
            dioException: e,
          ),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failures, void>> uploadMessageToFirebase({
    required ChatMessageModel chatMessageModel,
  }) async {
    try {
      final User? user = auth.currentUser;
      final chatRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .collection('chats')
          .doc(chatMessageModel.chatId);

      final docSnapshot = await chatRef.get();

      if (docSnapshot.exists) {
        await chatRef.update(
          {
            'messages': FieldValue.arrayUnion(
              [
                chatMessageModel.message.toMap(),
              ],
            )
          },
        );
      } else {
        await chatRef.set(
          chatMessageModel.toMap(),
        );
      }

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failures, List<Message>>> fetchMessages({
    required String chatId,
  }) async* {
    try {
      final User? user = auth.currentUser;
      List<Message> previousMessages = [];
      await for (final snapshot in FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('chats')
          .doc(chatId)
          .snapshots()) {
        final data = snapshot.data();
        final messages = data?['messages'] as List<dynamic>?;

        if (messages != null) {
          final messagesList = messages.map((message) {
            return Message.fromFireStore(message);
          }).toList();
          final newMessages = messagesList
              .where(
                (message) => !previousMessages.contains(message),
              )
              .toList();

          yield right(newMessages);
          previousMessages = messagesList;
        }
      }
    } catch (e) {
      yield left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<FastActionModel>>> fetchFastActions({
    required String currentLang,
  }) async {
    try {
      var docSnapshot = await FirebaseFirestore.instance
          .collection('fastActions')
          .doc(currentLang)
          .get();

      List<dynamic> actionsData = docSnapshot.data()?['actions'] ?? [];

      final allFastActions = actionsData
          .map(
            (data) => FastActionModel.fromFirebase(data),
          )
          .toList();

      return right(allFastActions);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failures, UserModel>> fetchUserData() async* {
    try {
      User? user = auth.currentUser;

      await for (final snapshot in FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .snapshots()) {
        yield right(
          UserModel.fromFireBase(
            snapshot.data(),
          ),
        );
      }
    } catch (e) {
      yield Left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> updateUserDetails({
    String? name,
    final String? responseMode,
    final String? userInstuctions,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    try {
      final Map<String, dynamic> updateData = {};
      if (name != null) updateData['name'] = name;

      if (responseMode != null) {
        updateData['customInstructions.ResponseMode'] = responseMode;
      }

      if (userInstuctions != null) {
        updateData['customInstructions.UserInstuctions'] = userInstuctions;
      }
      if (updateData.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update(updateData);
      }
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failures, List<SavedChatModel>>> fetchSavedChats() async* {
    try {
      User? user = auth.currentUser;
      List<SavedChatModel> previousChats = [];

      await for (final snapshot in FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('chats')
          .orderBy('createdAt', descending: true)
          .snapshots()) {
        List<SavedChatModel> currentChats = snapshot.docs.map(
          (doc) {
            return SavedChatModel.fromFirestore(doc);
          },
        ).toList();
        // Find new chats
        List<SavedChatModel> newChats = currentChats.where(
          (newChat) {
            return !previousChats.any(
              (oldChat) {
                return oldChat.chatId == newChat.chatId;
              },
            );
          },
        ).toList();

        if (newChats.isNotEmpty) {
          yield Right(newChats);
        } else {
          yield const Right([]);
        }
        previousChats = currentChats;
      }
    } catch (e) {
      yield left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
