import 'package:dartz/dartz.dart';
import 'package:neura_chat/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> loginUserMethod(
      {required String email, required String password});

  Future<Either<Failure, void>> singUpUserMethod({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, void>> resetPasswordMethod({required String email});

  Future<Either<Failure, void>> googleLogin();
}
