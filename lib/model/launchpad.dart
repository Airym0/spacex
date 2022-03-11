import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Launchpad {
  String id;
  String name;
  String full_name;
  double latitude;
  double longitude;

  Launchpad({required this.id, required this.name, required this.full_name, required this.latitude, required this.longitude});

  factory Launchpad.fromJson(Map<String, dynamic> json) =>
      _$LaunchpadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchpadToJson(this);
}