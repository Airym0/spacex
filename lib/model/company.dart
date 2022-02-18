import 'package:json_annotation/json_annotation.dart';

import 'headquarters.dart';
import 'links.dart';

part 'company.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Company {
  String name;
  int founded;
  int employees;
  String founder;
  String ceo;
  String summary;
  Links links;
  Headquarters headquarters;

  Company(
      {required this.headquarters,
      required this.founded,
      required this.employees,
      required this.founder,
      required this.ceo,
      required this.summary,
      required this.links,
      required this.name});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
