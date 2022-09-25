import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/providers/http_provider.dart';
import '/providers/auth_provider.dart';

class AuthHttpRepo with ChangeNotifier {
  Map<String, Object?> authLocalStorage = {
    'idToken': null,
    'email': null,
    'localId': null,
    'expiresInDate': null,
  };

  Future<String?> signUpWithEmailAndPass(String email, String pass) async {
    try {
      final authResult =
          await HttpRequests().signUpWithEmailAndPass(email, pass);
      if (authResult['error'] != null) {
        final errorMessage = (authResult['error'] as Map)['message'];
        return errorMessage;
      } else {
        authLocalStorage = AuthProvider().createAuthMap(authResult);
        final authData = AuthProvider().createAuthStringData(authResult);
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authData', authData);
        await _autoSignOut();
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<String?> signInWithEmailAndPass(String email, String pass) async {
    try {
      final authResult =
          await HttpRequests().signInWithEmailAndPass(email, pass);
      if (authResult['error'] != null) {
        final errorMessage = (authResult['error'] as Map)['message'];
        return errorMessage;
      } else {
        authLocalStorage = AuthProvider().createAuthMap(authResult);
        final authData = AuthProvider().createAuthStringData(authResult);
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authData', authData);
        await _autoSignOut();
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  bool checkAuthenticate() {
    return AuthProvider().isAuth(authLocalStorage);
  }

  Future<void> _autoSignOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('authData')) {
        final authData = json.decode(prefs.getString('authData')!);
        AuthProvider().autoSignOut(authData, signOut);
      }
    } catch (error) {
      rethrow;
    }
  }

  void signOut() async {
    authLocalStorage = {
      'idToken': null,
      'email': null,
      'localId': null,
      'expiresInDate': null,
    };
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('authData')) {
        prefs.clear();
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }
}
