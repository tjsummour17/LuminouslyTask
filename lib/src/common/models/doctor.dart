import 'package:json_annotation/json_annotation.dart';
import 'package:luminously/src/common/models/address.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  Doctor({
    required this.id,
    required this.doctorName,
    required this.doctorEmail,
    required this.phoneNumber,
    required this.doctorImageURL,
    required this.address,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  final int id;
  final String doctorName;
  final String doctorEmail;
  final String phoneNumber;
  final String doctorImageURL;
  final Address address;

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
