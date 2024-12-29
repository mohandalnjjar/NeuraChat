import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/core/services/api_services.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/models/user_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    try {
      final preferences = await SharedPreferences.getInstance();
      final userDetails =
          preferences.getString('geniusModeUserInfoKey') ?? 'User';
      final instructions = preferences.getString('geniusModeInstructionsKey') ??
          'Provide helpful and engaging responses.';
      if (messageHistory.isEmpty) {
        messageHistory.add(
          {
            "role": "user",
            "parts": [
              {"text": "My Details:\n:$userDetails\n act as: $instructions"},
              {"text": "Your name is Neura"},
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
  Stream<Either<Failures, List<Message>>> fetchStreamMessages({
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
  Future<Either<Failures, void>> saveInstruction({
    required String instruction,
    required GeniusMode geniusMode,
  }) async {
    try {
      final String geniusModeKey = geniusMode == GeniusMode.userInfo
          ? 'geniusModeUserInfoKey'
          : 'geniusModeInstructionsKey';
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(geniusModeKey, instruction);

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
  Future<Either<Failures, Map<String, String?>>> getSavedInstruction() async {
    try {
      final preferences = await SharedPreferences.getInstance();

      final geniusKeys = ['geniusModeUserInfoKey', 'geniusModeInstructionsKey'];

      final result = <String, String?>{};

      for (var key in geniusKeys) {
        result[key] = preferences.getString(key);
      }

      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
