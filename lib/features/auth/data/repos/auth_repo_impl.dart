import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neura_chat/core/utils/errors/app_failures_handler.dart';
import 'package:neura_chat/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failures, void>> loginUserMethod(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

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
  Future<Either<Failures, void>> singUpUserMethod({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await createUserDetailsFistTime(name: name, email: email);

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
      await auth.sendPasswordResetEmail(email: email);
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
        await createUserDetailsFistTime(
            name: gUser.email.replaceAll('@gmail.com', ''), email: gUser.email);
      } else {
        // await addUserDetailsWithGoogle(
        //     name: gUser.email.replaceAll('@gmail.com', ''), email: gUser.email);
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
  Future<void> createUserDetailsFistTime({
    required String name,
    required String email,
  }) async {
    User? user = auth.currentUser;
    final uid = user!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      {
        'userId': uid,
        'name': name,
        'profileImage':
            'https://firebasestorage.googleapis.com/v0/b/swift-mart-9e189.appspot.com/o/unknown_user.png?alt=media&token=7bd2a2fa-7807-4b31-afd7-e179e4151e0a',
        'email': email,
        'createdAt': Timestamp.now(),
      },
    );
  }
}
