import 'package:json_annotation/json_annotation.dart';

part 'headquarters.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Headquarters {
  String address;
  String city;
  String state;

  Headquarters(
      {required this.address,
        required this.city,
        required this.state});

  factory Headquarters.fromJson(Map<String, dynamic> json) => _$HeadquartersFromJson(json);

  Map<String, dynamic> toJson() => _$HeadquartersToJson(this);
}