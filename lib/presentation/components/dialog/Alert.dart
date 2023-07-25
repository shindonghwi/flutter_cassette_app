import 'package:cassette/presentation/components/button/FillButton.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';

enum AlertType { Welcome }

class Alert {
  static void showAlert(
    BuildContext context,
    AlertType alertType, {
    bool dimTouchDismiss = false,
  }) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) => _rootAlertCase(
        context: ctx,
        child: _alertNav(context, alertType),
      ),
    );
  }

  static Widget _rootAlertCase({required BuildContext context, required Widget child}) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: getColorScheme(context).bg,
      content: Container(
        decoration: BoxDecoration(
          color: getColorScheme(context).bg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }

  static Widget _alertNav(BuildContext context, AlertType alertType) {
    switch (alertType) {
      case AlertType.Welcome:
        return _alertWelcome(context);
    }
  }

  /// View

  static Widget _alertWelcome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getAppLocalizations(context).alert_welcome_title,
            style: getTextTheme(context).h3_B.copyWith(
                  color: getColorScheme(context).gray70,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            getAppLocalizations(context).alert_welcome_body,
            style: getTextTheme(context).h3_R.copyWith(
                  color: getColorScheme(context).gray60,
                ),
          ),
          const SizedBox(
            height: 28,
          ),
          FillButton.round(
            content: Text(
              getAppLocalizations(context).common_confirm,
              style: getTextTheme(context).b1_R.copyWith(
                    color: getColorScheme(context).white,
                  ),
            ),
            isActivated: true,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
