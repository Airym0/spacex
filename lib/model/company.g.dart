// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Company',
      json,
      ($checkedConvert) {
        final val = Company(
          headquarters: $checkedConvert('headquarters',
              (v) => Headquarters.fromJson(v as Map<String, dynamic>)),
          founded: $checkedConvert('founded', (v) => v as int),
          employees: $checkedConvert('employees', (v) => v as int),
          founder: $checkedConvert('founder', (v) => v as String),
          ceo: $checkedConvert('ceo', (v) => v as String),
          summary: $checkedConvert('summary', (v) => v as String),
          links: $checkedConvert(
              'links', (v) => Links.fromJson(v as Map<String, dynamic>)),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'founded': instance.founded,
      'employees': instance.employees,
      'founder': instance.founder,
      'ceo': instance.ceo,
      'summary': instance.summary,
      'links': instance.links.toJson(),
      'headquarters': instance.headquarters.toJson(),
    };
