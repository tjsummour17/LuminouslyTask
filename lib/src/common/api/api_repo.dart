import 'dart:convert';

import 'package:luminously/src/common/api/api_client.dart';
import 'package:luminously/src/common/models/doctor.dart';

class ApiRepo {
  factory ApiRepo() {
    return _instance;
  }

  ApiRepo._internal();

  static final ApiRepo _instance = ApiRepo._internal();
  final ApiClient apiClient = ApiClient();
  final String basicAuth = 'Basic ' +
      base64.encode(
        utf8.encode(
          'FlutterDev@LuminousKey.com:Flutter2023',
        ),
      );

  Future<List<Doctor>> getDoctorsInfo() {
    return apiClient.getDoctorsInfo(basicAuth);
  }
}
