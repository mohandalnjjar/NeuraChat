import 'package:dartz/dartz.dart';
import 'package:neura_chat/core/errors/app_failures_handler.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> loginUserMethod(
      {required String email, required String password});

  Future<Either<Failures, void>> singUpUserMethod({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failures, void>> resetPasswordMethod({required String email});

  Future<Either<Failures, void>> googleLogin();

  Future<void> addUserDetailsFistTime({
    required String name,
    required String email,
  });

  Future<Either<Failures, bool>> checkAuthState();
  Future<Either<Failures, void>> logOut();
  Future<Either<Failures, void>> signInAnonymously();
}
