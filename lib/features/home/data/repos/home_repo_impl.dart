import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/core/services/api_services.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo.dart';
import 'package:uuid/uuid.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices = ApiServices();
  final Uuid uuid = const Uuid();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failures, MessageModel>> sendMessage(
      {required String message}) async {
    try {
      var response = await apiServices.post(
        url:
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent',
        body: {
          "contents": [
            {
              "parts": [
                {"text": message}
              ]
            }
          ]
        },
        apiKey: 'AIzaSyCECyK_KdAvVAW8S0KCFCPK-mSGXiUhtes',
        contentType: Headers.jsonContentType,
      );

      return right(
        MessageModel.fromJson(
          jsonData: response.data,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        print("tttttttttttttttttttttttttttttttttttttttttttttttttttttt");
        print(e.toString());
        return left(
          ServerFailure.fromDioError(
            dioException: e,
          ),
        );
      } else {
        print("ffffffffffffffffffffffffffffffffffffffffffffffff");
        print(e.toString());
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
        await chatRef.update({
          'messages': FieldValue.arrayUnion(
            [
              chatMessageModel.message.toMap(),
            ],
          )
        });
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
}
