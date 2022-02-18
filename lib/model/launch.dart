import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Launch {
  String id;
  int flight_number;
  String name;
  String date_utc;
  bool? isFavorite;

  Launch({required this.id, required this.flight_number, required this.name, required this.date_utc, this.isFavorite});

  factory Launch.fromJson(Map<String, dynamic> json) =>
      _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}