import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/auth_model.dart';
import '/helpers/http_helper.dart';

class AuthProvider with ChangeNotifier {
  static const _authDataKey = 'authData';
  var _auth = Auth();
  Timer? _authTimer;

  var authError = '';

  bool isAuth() {
    if (_auth.idToken != null && _auth.expiresInDate != null) {
      final DateTime timeToExpire = DateTime.parse(_auth.expiresInDate!);
      final DateTime timeToNow = DateTime.now();

      if (timeToExpire.isAfter(timeToNow)) {
        return true;
      }
    }
    return false;
  }

  Future<bool> _setAuthData(String authDataString) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(_authDataKey)) {
      prefs.remove(_authDataKey);
    }
    return await prefs.setString(_authDataKey, authDataString);
  }

  Future<String?> _getAuthData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(_authDataKey)) {
      return prefs.getString(_authDataKey);
    }
    return null;
  }

  Future<void> _cleanAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_authDataKey)) {
      prefs.remove(_authDataKey);
    }
    return;
  }

  Future<void> signUpWithEmailAndPass(String email, String pass) async {
    final authResult = await HttpHelper.authenticate('signUp', email, pass);

    if (authResult['error'] != null) {
      authError = (authResult['error'] as Map)['message'];
      _auth = Auth();
    } else {
      authError = '';
      _auth = Auth(
        email: authResult['email'] as String,
        expiresInDate: DateTime.now()
            .add(
              Duration(
                seconds: int.parse(authResult['expiresIn'] as String),
              ),
            )
            .toIso8601String(),
        idToken: authResult['idToken'] as String,
        localId: authResult['localId'] as String,
      );
      _autoLogOut();

      final authDataString = json.encode(_auth.toMap());
      await _setAuthData(authDataString);
    }
    notifyListeners();
    return;
  }

  Future<void> signInWithEmailAndPass(String email, String pass) async {
    final authResult =
        await HttpHelper.authenticate('signInWithPassword', email, pass);

    if (authResult['error'] != null) {
      authError = (authResult['error'] as Map)['message'];
      _auth = Auth();
    } else {
      authError = '';
      _auth = Auth(
        email: authResult['email'] as String,
        expiresInDate: DateTime.now()
            .add(
              Duration(
                seconds: int.parse(authResult['expiresIn'] as String),
              ),
            )
            .toIso8601String(),
        idToken: authResult['idToken'] as String,
        localId: authResult['localId'] as String,
      );
      _autoLogOut();

      final authDataString = json.encode(_auth.toMap());
      await _setAuthData(authDataString);
    }
    notifyListeners();
    return;
  }

  Future<void> tryAutoLogIn() async {
    final authDataString = await _getAuthData();

    if (authDataString != null) {
      final authDataMap = json.decode(authDataString);

      _auth = Auth(
        email: authDataMap['email'],
        expiresInDate: authDataMap['expiresInDate'],
        idToken: authDataMap['idToken'],
        localId: authDataMap['localId'],
      );
      _autoLogOut();
      notifyListeners();
    }
    return;
  }

  void _autoLogOut() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }

    if (_auth.expiresInDate != null) {
      final expiresInDate = DateTime.parse(_auth.expiresInDate!);
      final nowDate = DateTime.now();
      final timeToExpires = expiresInDate.difference(nowDate).inSeconds;

      _authTimer = Timer(Duration(seconds: timeToExpires), logOut);
    }
  }

  void logOut() {
    authError = '';
    _auth = Auth();
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    _cleanAuthData();
    notifyListeners();
  }

  Future<void> forgotPassword(String email) async {
    final response = await HttpHelper.sendPasswordResetEmail(email);

    if (response['error'] != null) {
      authError = (response['error'] as Map)['message'];
    } else {
      authError = '';
    }
    notifyListeners();
    return;
  }
}
