import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  final String latitude;
  final String longitude;
  final String country;
  final String city;

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
