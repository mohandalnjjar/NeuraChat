abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class FirebaseAuthExcep extends Failure {
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
          errorMessage: 'may be your email or password wrong');
    } else if (errorCode == 'email-already-in-use') {
      return FirebaseAuthExcep(
          errorMessage: 'The account already exists for that email.');
    } else {
      return FirebaseAuthExcep(errorMessage: errorCode);
    }
  }
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

class ImageError extends Failure {
  ImageError({required super.errorMessage});
}

class StripeFailure extends Failure {
  StripeFailure({required super.errorMessage});

  factory StripeFailure.fromStripeException({required String errorCode}) {
    if (errorCode == 'card_declined') {
      return StripeFailure(errorMessage: 'The card was declined.');
    } else if (errorCode == 'expired_card') {
      return StripeFailure(errorMessage: 'The card has expired.');
    } else if (errorCode == 'null') {
      return StripeFailure(errorMessage: 'The payment canceld.');
    } else if (errorCode == 'incorrect_cvc') {
      return StripeFailure(errorMessage: 'The CVC code is incorrect.');
    } else if (errorCode == 'incorrect_number') {
      return StripeFailure(errorMessage: 'The card number is incorrect.');
    } else if (errorCode == 'insufficient_funds') {
      return StripeFailure(errorMessage: 'There are insufficient funds.');
    } else if (errorCode == 'invalid_card_type') {
      return StripeFailure(errorMessage: 'This card type is not supported.');
    } else if (errorCode == 'processing_error') {
      return StripeFailure(errorMessage: 'There was a processing error.');
    } else if (errorCode == 'rate_limit') {
      return StripeFailure(
          errorMessage: 'Too many requests made to the API too quickly.');
    } else if (errorCode == 'authentication_required') {
      return StripeFailure(
          errorMessage: 'Authentication is required to complete the payment.');
    } else if (errorCode == 'invalid_request_error') {
      return StripeFailure(errorMessage: 'Invalid request error.');
    } else {
      return StripeFailure(
          errorMessage: 'An unknown error occurred: $errorCode');
    }
  }
}
