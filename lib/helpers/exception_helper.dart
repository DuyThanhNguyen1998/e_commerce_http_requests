import 'package:flutter/material.dart';

class ExceptionHelper {
  ExceptionHelper({this.message});

  final String? message;

  String exceptionMessageFilter(String message) {
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

  void showException(BuildContext ctx) {
    if (message != null) {
      final content = exceptionMessageFilter(message!);
      showDialog<void>(
        context: ctx,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'An Error Occurs',
            style: Theme.of(ctx).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          content: Text(
            content,
            style: Theme.of(ctx).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text(
                'Got it',
                style: Theme.of(ctx).textTheme.labelMedium,
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
}
