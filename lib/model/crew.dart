import 'package:json_annotation/json_annotation.dart';
import 'package:space_x/model/launch.dart';

part 'crew.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Crew {
  String id;
  String name;
  String agency;
  String image;
  String wikipedia;
  String status;

  Crew(
      {required this.id,
        required this.name,
        required this.agency,
        required this.image,
        required this.wikipedia,
        required this.status
      });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}