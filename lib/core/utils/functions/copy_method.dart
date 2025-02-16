import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';

void copyMethod(
  BuildContext context,
  String content,
) {
  Clipboard.setData(
    ClipboardData(
      text: content,
    ),
  );
  popUpAlert(context: context, message: 'copied to clipboard');
}
