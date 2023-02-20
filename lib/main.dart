import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:luminously/src/common/models/user.dart';
import 'package:luminously/src/common/services/auto_login.dart';
import 'package:luminously/src/common/services/local_database.dart';
import 'package:luminously/src/common/services/sqllite_helper.dart';
import 'package:luminously/src/features/app/application_material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  User? user;
  try {
    await SqlLightHelper.initDatabase();
    await LocaleDatabase.initializeLocaleDatabase();
    user = await AutoLogin.login();
  } catch (e) {
    log(e.toString());
  }
  runApp(ApplicationMaterial(user: user));
}
