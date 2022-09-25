import 'dart:async';
import 'dart:convert';

import '/models/auth_model.dart';

class AuthProvider {
  Timer? _authTimer;

  Map<String, Object?> createAuthMap(Map<String, Object?> authData) {
    final auth = Auth(
      email: authData['email'] as String,
      expiresInDate: DateTime.now()
          .add(
            Duration(
              seconds: int.parse(authData['expiresIn'] as String),
            ),
          )
          .toIso8601String(),
      idToken: authData['idToken'] as String,
      localId: authData['localId'] as String,
    );
    return auth.toMap();
  }

  String createAuthStringData(Map<String, Object?> authData) {
    final auth = Auth(
      email: authData['email'] as String,
      expiresInDate: DateTime.now()
          .add(
            Duration(
              seconds: int.parse(authData['expiresIn'] as String),
            ),
          )
          .toIso8601String(),
      idToken: authData['idToken'] as String,
      localId: authData['localId'] as String,
    );
    return json.encode(auth.toMap());
  }

  bool isAuth(Map<String, Object?> authData) {
    if (authData['idToken'] != null) {
      final expiresInDate = authData['expiresInDate'] as String;
      if (DateTime.now().isBefore(DateTime.parse(expiresInDate))) {
        return true;
      }
    }
    return false;
  }

  void autoSignOut(
    Map<String, Object?> authData,
    void Function() callback,
  ) {
    if (authData['expiresInDate'] != null) {
      final expiresInDate = DateTime.parse(authData['expiresInDate'] as String);
      final timeToExpire = expiresInDate.difference(DateTime.now()).inSeconds;

      if (_authTimer != null) {
        _authTimer!.cancel();
      }
      _authTimer = Timer(Duration(seconds: timeToExpire), callback);
    }
  }
}
