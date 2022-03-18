import 'package:json_annotation/json_annotation.dart';
import 'package:space_x/model/patch.dart';
part 'links_launch.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class LinksLaunch {
  Patch patch;

  LinksLaunch(
      {required this.patch});

  factory LinksLaunch.fromJson(Map<String, dynamic> json) => _$LinksLaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LinksLaunchToJson(this);
}