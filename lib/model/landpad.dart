import 'package:json_annotation/json_annotation.dart';

part 'landpad.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Landpad {
  String id;
  String name;
  String full_name;
  double latitude;
  double longitude;

  Landpad({required this.id, required this.name, required this.full_name, required this.latitude, required this.longitude});

  factory Landpad.fromJson(Map<String, dynamic> json) =>
      _$LandpadFromJson(json);

  Map<String, dynamic> toJson() => _$LandpadToJson(this);
}