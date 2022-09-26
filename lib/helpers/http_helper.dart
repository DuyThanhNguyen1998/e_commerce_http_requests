import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static const _androidAPIKey = 'AIzaSyCGIYAAonecPgpoOTz5ubiG95jvaMeNyRY';

  static Future<Map<String, Object?>> authenticate(
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

  static Future<Map<String, Object?>> sendPasswordResetEmail(
      String email) async {
    final url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_androidAPIKey',
    );

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'requestType': 'PASSWORD_RESET',
            'email': email,
          },
        ),
      );
      return json.decode(response.body);
    } catch (error) {
      return {};
    }
  }
}
