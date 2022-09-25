import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequests {
  final _androidAPIKey = 'AIzaSyCGIYAAonecPgpoOTz5ubiG95jvaMeNyRY';

  Future<Map<String, Object?>> _authenticate(
    String action,
    String email,
    String pass,
  ) async {
    final url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=$_androidAPIKey',
    );
    try {
      final authResult = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': pass,
            'returnSecureToken': true,
          },
        ),
      );
      return json.decode(authResult.body);
    } catch (error) {
      return {};
    }
  }

  Future<Map<String, Object?>> signUpWithEmailAndPass(
    String email,
    String pass,
  ) async {
    return _authenticate('signUp', email, pass);
  }

  Future<Map<String, Object?>> signInWithEmailAndPass(
    String email,
    String pass,
  ) async {
    return _authenticate('signInWithPassword', email, pass);
  }
}
