import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<String?> getAndroidAPIKey() async {
    try {
      final contents = await rootBundle.loadString(
        'assets/files/project_info.json',
      );

      final data = json.decode(contents);
      final apiKey = data['apiKey']['android'];
      return apiKey;
    } catch (error) {
      return null;
    }
  }

  static Future<String?> getIOSAPIKey() async {
    try {
      final contents = await rootBundle.loadString(
        'assets/files/project_info.json',
      );

      final data = json.decode(contents);
      final apiKey = data['apiKey']['ios'];
      return apiKey;
    } catch (error) {
      return null;
    }
  }

  static Future<Map<String, Object?>> authenticate(
    String action,
    String email,
    String pass,
  ) async {
    String? apiKey;

    if (Platform.isAndroid) {
      apiKey = await getAndroidAPIKey();
    } else if (Platform.isIOS) {
      apiKey = await getIOSAPIKey();
    }

    if (apiKey != null) {
      final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=$apiKey',
      );
      try {
        final response = await http.post(
          url,
          body: json.encode(
            {
              'email': email,
              'password': pass,
              'returnSecureToken': true,
            },
          ),
        );
        return json.decode(response.body);
      } catch (error) {
        return {
          'error': {
            'message': error.toString(),
          },
        };
      }
    } else {
      return {
        'error': {
          'message': 'API key is null',
        },
      };
    }
  }

  static Future<Map<String, Object?>> sendPasswordResetEmail(
    String email,
  ) async {
    String? apiKey;

    if (Platform.isAndroid) {
      apiKey = await getAndroidAPIKey();
    } else if (Platform.isIOS) {
      apiKey = await getIOSAPIKey();
    }

    if (apiKey != null) {
      final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$apiKey',
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
        return {
          'error': {
            'message': error.toString(),
          },
        };
      }
    } else {
      return {
        'error': {
          'message': 'API key is null',
        },
      };
    }
  }

  static Future<Map<String, Object?>> updateProfile(
    String idToken,
    String displayName,
    String photoUrl,
  ) async {
    String? apiKey;

    if (Platform.isAndroid) {
      apiKey = await getAndroidAPIKey();
    } else if (Platform.isIOS) {
      apiKey = await getIOSAPIKey();
    }

    if (apiKey != null) {
      final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=$apiKey',
      );

      try {
        final response = await http.post(
          url,
          body: json.encode(
            {
              'idToken': idToken,
              'displayName': displayName,
              'photoUrl': photoUrl,
              'deleteAttribute': [],
              'returnSecureToken': true,
            },
          ),
        );
        return json.decode(response.body);
      } catch (error) {
        return {
          'error': {
            'message': error.toString(),
          },
        };
      }
    } else {
      return {
        'error': {
          'message': 'API key is null',
        },
      };
    }
  }

  static Future<Map<String, Object?>> getUserData(String idToken) async {
    String? apiKey;

    if (Platform.isAndroid) {
      apiKey = await getAndroidAPIKey();
    } else if (Platform.isIOS) {
      apiKey = await getIOSAPIKey();
    }

    if (apiKey != null) {
      final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=$apiKey',
      );

      try {
        final response = await http.post(
          url,
          body: json.encode(
            {
              'idToken': idToken,
            },
          ),
        );
        return json.decode(response.body);
      } catch (error) {
        return {
          'error': {
            'message': error.toString(),
          },
        };
      }
    } else {
      return {
        'error': {
          'message': 'API key is null',
        },
      };
    }
  }
}
