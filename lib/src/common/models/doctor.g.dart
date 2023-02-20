// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: json['id'] as int,
      doctorName: json['doctorName'] as String,
      doctorEmail: json['doctorEmail'] as String,
      phoneNumber: json['phoneNumber'] as String,
      doctorImageURL: json['doctorImageURL'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'doctorName': instance.doctorName,
      'doctorEmail': instance.doctorEmail,
      'phoneNumber': instance.phoneNumber,
      'doctorImageURL': instance.doctorImageURL,
      'address': instance.address,
    };
