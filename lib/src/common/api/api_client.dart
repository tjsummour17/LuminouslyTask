import 'package:dio/dio.dart';
import 'package:luminously/src/common/models/doctor.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

const String baseUrl = "https://flutter.linked4med.com/api/";

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient() => _ApiClient(Dio());
  static const String _authorization = 'Authorization';

  @GET('/Doctors/GetDoctorsInfo')
  Future<List<Doctor>> getDoctorsInfo(
    @Header(_authorization) String token,
  );
}
