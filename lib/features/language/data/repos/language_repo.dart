import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class LanguageRepo {
  Future<Either<String, void>> setLanguage({required String langValue});
  Future<Either<String, String>> getLanguage({required BuildContext context});
}
