import 'package:flutter/material.dart';
import 'package:neura_chat/core/utils/widgets/desktop_alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/mobile_alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/adaptive_layout.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> alertPopUp({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.all(5),
        child: AdaptiveLayout(
          mobileLayout: (BuildContext context) {
            return MobileAlertPopUp(
              message: message,
            );
          },
          tabletLayout: (BuildContext context) {
            return DesktopAlertPopUp(
              message: message,
            );
          },
          desktopLayout: (BuildContext context) {
            return MobileAlertPopUp(
              message: message,
            );
          },
        ),
      ),
    ),
  );
}
