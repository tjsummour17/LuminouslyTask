import 'dart:developer';

import 'package:luminously/src/common/models/user.dart';
import 'package:luminously/src/common/services/local_database.dart';
import 'package:luminously/src/common/services/sqllite_helper.dart';

class AutoLogin {
  AutoLogin._();

  static Future<User?> _authenticate({
    required String email,
    required String password,
  }) async {
    try {
      final User? user = await SqlLightHelper.authenticate(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<User?> login() async {
    final Map<String, dynamic>? userInfo = LocaleDatabase.getUserInfo();
    if (userInfo != null) {
      final String username = userInfo['email'] as String;
      final String password = userInfo['password'] as String;
      return await _authenticate(email: username, password: password);
    }
    return null;
  }
}
