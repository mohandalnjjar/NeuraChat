import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';
import 'package:neura_chat/core/utils/functions/check_internet_connectivity.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failures, void>> loginUserMethod({
    required String email,
    required String password,
  }) async {
    try {
      bool isConnected = await checkInternetConnection();

      if (!isConnected) {
        return left(
          FirebaseAuthExcep(
            errorMessage:
                "No internet connection. Please check your network settings.",
          ),
        );
      }

      await auth.signInWithEmailAndPassword(email: email, password: password);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(errorCode: e.code),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failures, void>> singUpUserMethod({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      bool isConnected = await checkInternetConnection();
      if (!isConnected) {
        return left(
          FirebaseAuthExcep(
            errorMessage:
                "No internet connection. Please check your network settings.",
          ),
        );
      }
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await addUserDetailsFistTime(name: name, email: email);

      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(
            errorCode: e.code,
          ),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failures, void>> resetPasswordMethod(
      {required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(
            errorCode: e.code,
          ),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failures, void>> googleLogin() async {
    try {
      //Check internet connectivity befre starting
      bool isConnected = await checkInternetConnection();
      if (!isConnected) {
        return left(
          FirebaseAuthExcep(
            errorMessage:
                "No internet connection. Please check your network settings.",
          ),
        );
      }

      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        return left(
          FirebaseAuthExcep(
            errorMessage: 'Google login canceled',
          ),
        );
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
      if (isNewUser) {
        await addUserDetailsFistTime(
            name: gUser.email.replaceAll('@gmail.com', ''), email: gUser.email);
      }
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(
            errorCode: e.code,
          ),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<void> addUserDetailsFistTime({
    required String name,
    required String email,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    User? user = auth.currentUser;
    final uid = user!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      {
        'userId': uid,
        'name': name,
        'profileImage': '',
        'createdAt': Timestamp.now(),
      },
    );
  }

  @override
  Stream<Either<Failures, bool>> checkAuthState() async* {
    try {
      await for (final User? user in auth.authStateChanges()) {
        if (user != null) {
          yield right(user.isAnonymous);
        } else {
          yield left(
            FirebaseAuthExcep(
              errorMessage: "Login to get full access",
            ),
          );
        }
      }
    } catch (e) {
      yield left(
        FirebaseAuthExcep(errorMessage: "An unexpected error occurred: $e"),
      );
    }
  }

  @override
  Future<Either<Failures, void>> logOut() async {
    try {
      final User? user = auth.currentUser;

      if (user != null && user.isAnonymous) {
        await user.delete();
      }
      await auth.signOut();

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: 'can\'t log out',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> signInAnonymously() async {
    try {
      await auth.signInAnonymously();

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: "Failed to sign in",
        ),
      );
    }
  }
}
