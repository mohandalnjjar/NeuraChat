import 'package:flutter/material.dart';

String getCurrentLanguage(BuildContext context) {
  return Localizations.localeOf(context).languageCode;
}
