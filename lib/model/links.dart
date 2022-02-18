import 'package:json_annotation/json_annotation.dart';
part 'links.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Links {
  String website;
  String flickr;
  String twitter;
  String elon_twitter;

  Links(
      {required this.website,
        required this.flickr,
        required this.twitter,
        required this.elon_twitter});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}