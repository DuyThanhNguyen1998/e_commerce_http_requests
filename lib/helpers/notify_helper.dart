import 'package:flutter/material.dart';

class NotifyHelper {
  static String _notifyMessageFilter(String message) {
    switch (message) {
      case 'EMAIL_EXISTS':
        return 'This email is used by another user';
      case 'EMAIL_NOT_FOUND':
        return 'This email have not been sign up';
      case 'INVALID_PASSWORD':
        return 'Password for this account is not match';
      default:
        return message;
    }
  }

  static Future<void> showException(
    BuildContext ctx,
    String message,
    bool isOnSignIn,
    String routeName,
  ) {
    final content = _notifyMessageFilter(message);
    return showDialog<void>(
      barrierDismissible: false,
      context: ctx,
      builder: (bCtx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          'An Error Occurs',
          style: Theme.of(bCtx).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          style: Theme.of(bCtx).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                bCtx,
                routeName,
                arguments: isOnSignIn,
              );
            },
            child: Text(
              'Got it',
              style: Theme.of(bCtx).textTheme.labelMedium,
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(
          right: 20,
          bottom: 10,
        ),
      ),
    );
  }

  static Future<void> showNotification(
    BuildContext ctx,
    String title,
    String message,
    String routeName,
  ) async {
    final content = _notifyMessageFilter(message);
    return showDialog<void>(
      barrierDismissible: false,
      context: ctx,
      builder: (bCtx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          title,
          style: Theme.of(bCtx).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          style: Theme.of(bCtx).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                bCtx,
                routeName,
              );
            },
            child: Text(
              'Got it',
              style: Theme.of(bCtx).textTheme.labelMedium,
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(
          right: 20,
          bottom: 10,
        ),
      ),
    );
  }
}
