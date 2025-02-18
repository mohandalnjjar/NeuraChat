import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/core/services/api_services.dart';
import 'package:neura_chat/core/services/secrets_keys.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
import 'package:neura_chat/features/home/data/models/user_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';
import 'package:uuid/uuid.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices = ApiServices();
  final Uuid uuid = const Uuid();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<Map<String, dynamic>> messageHistory = [];

  @override
  Future<Either<Failures, MessageModel>> sendMessage({
    required String userMessage,
  }) async {
    final User? user = auth.currentUser;

    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      final Map<String, dynamic> customInstructions =
          (userDoc.data() as Map<String, dynamic>?)?['customInstructions'] ??
              {};
      if (messageHistory.isEmpty) {
        messageHistory.add(
          {
            "role": "user",
            "parts": [
              {"text": "My Details:\n${customInstructions.toString()}"},
              {"text": "when user ask about your name response with Neura"},
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
        apiKey: SecretsKeys.geminiApiKey,
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
  Future<Either<Failures, void>> saveChat({
    required List<Message> messages,
    String? chatid,
  }) async {
    try {
      final User? user = auth.currentUser;

      if (user == null || user.isAnonymous) {
        return right(null);
      }

      final chatRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('SavedChats')
          .doc(chatid ?? uuid.v4());

      final docSnapshot = await chatRef.get();
      final List<Map<String, dynamic>> messagesMap = messages
          .map(
            (message) => message.toMap(),
          )
          .toList();

      if (docSnapshot.exists) {
        chatRef.delete();
        await chatRef.set(
          {
            'SavedAt': Timestamp.now(),
            'ChatId': chatRef.id,
            'messages': messagesMap,
          },
        );
      } else {
        await chatRef.set(
          {
            'SavedAt': Timestamp.now(),
            'ChatId': chatRef.id,
            'messages': messagesMap,
          },
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
        FirebaseAuthExcep(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failures, UserModel>> fetchUserData() async* {
    try {
      User? user = auth.currentUser;
      if (user == null || user.isAnonymous) {
        return;
      }

      await for (final snapshot in FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
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
      if (user == null || user.isAnonymous) {
        return right(null);
      }
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
            .doc(user.uid)
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
  Future<Either<Failures, List<SavedChatModel>>>
      fetchInitialSavedChats() async {
    try {
      User? user = auth.currentUser;

      if (user == null || user.isAnonymous) {
        return right([]);
      }

      final querySnapshot = await firestore
          .collection('users')
          .doc(user.uid)
          .collection('SavedChats')
          .orderBy('SavedAt', descending: true)
          .limit(5)
          .get();

      final chats = querySnapshot.docs.map((chat) {
        return SavedChatModel.fromFirestore(chat);
      }).toList();

      return right(chats);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<SavedChatModel>>> fetchMoreSavedChats(
      SavedChatModel lastMessage) async {
    try {
      User? user = auth.currentUser;

      final querySnapshot = await firestore
          .doc(user!.uid)
          .collection('SavedChats')
          // .orderBy('SavedAt', descending: true)
          // .startAfter([lastMessage.savedAt])
          .limit(20)
          .get();

      final chats = querySnapshot.docs.map((chat) {
        return SavedChatModel.fromFirestore(chat);
      }).toList();

      return right(chats);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> deletSavedChat({
    required String chatId,
  }) async {
    try {
      User? user = auth.currentUser;

      await firestore
          .collection('users')
          .doc(user!.uid)
          .collection('SavedChats')
          .doc(chatId)
          .delete();
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
