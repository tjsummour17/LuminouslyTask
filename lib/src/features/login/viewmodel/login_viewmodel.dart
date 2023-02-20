import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:luminously/src/common/models/user.dart';
import 'package:luminously/src/common/services/local_database.dart';
import 'package:luminously/src/common/services/sqllite_helper.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool validLogin = false;
  String otp = "";

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    try {
      User? authenticatedUser = await SqlLightHelper.authenticate(
        email: email,
        password: password,
      );
      if (authenticatedUser != null) {
        validLogin = true;
        LocaleDatabase.saveUserInfo(
          email: email,
          password: password,
        );
        return authenticatedUser;
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading = false;
    return null;
  }
}
