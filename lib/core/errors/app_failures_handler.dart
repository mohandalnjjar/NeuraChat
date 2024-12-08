import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures({required this.errorMessage});
}

class FirebaseAuthExcep extends Failures {
  FirebaseAuthExcep({required super.errorMessage});

  factory FirebaseAuthExcep.fromFireException({required String errorCode}) {
    if (errorCode == 'user-not-found') {
      return FirebaseAuthExcep(errorMessage: 'No user found for that email.');
    } else if (errorCode == 'there is no user with this data') {
      return FirebaseAuthExcep(
          errorMessage:
              'The supplied auth credential is malformed or has expired.');
    } else if (errorCode == 'wrong-password') {
      return FirebaseAuthExcep(
          errorMessage: 'Wrong password provided for that user.');
    } else if (errorCode == 'weak-password') {
      return FirebaseAuthExcep(
          errorMessage: 'The password provided is too weak.');
    } else if (errorCode == 'invalid-credential') {
      return FirebaseAuthExcep(
          errorMessage: 'Maybe your email or password is incorrect.');
    } else if (errorCode == 'email-already-in-use') {
      return FirebaseAuthExcep(
          errorMessage: 'The account already exists for that email.');
    } else if (errorCode == 'network-request-failed') {
      return FirebaseAuthExcep(
          errorMessage:
              'No internet connection. Please check your network settings.');
    } else {
      return FirebaseAuthExcep(errorMessage: errorCode);
    }
  }
}

class ServerFailure extends Failures {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Check internet connectivity');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Check internet connectivity');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Check internet connectivity');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Api key not valid');
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request was cancel');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Check internet connectivity');
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'Try again, later');

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          statusCode: dioException.response!.statusCode!,
          response: dioException.response!.data,
        );
      default:
        return ServerFailure(errorMessage: 'Try again, later');
    }
  }

  factory ServerFailure.fromBadResponse({
    required int statusCode,
    required dynamic response,
  }) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage: 'your reqrust not found, please try again');
    } else if (statusCode == 503) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else {
      return ServerFailure(errorMessage: 'Some thing went wrong try again');
    }
  }
}

class ImageError extends Failures {
  ImageError({required super.errorMessage});
}
