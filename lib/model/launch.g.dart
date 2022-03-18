// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launch',
      json,
      ($checkedConvert) {
        final val = Launch(
          id: $checkedConvert('id', (v) => v as String),
          flight_number: $checkedConvert('flight_number', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          date_utc: $checkedConvert('date_utc', (v) => v as String),
          isFavorite: $checkedConvert('isFavorite', (v) => v as bool?),
          links: $checkedConvert(
              'links', (v) => LinksLaunch.fromJson(v as Map<String, dynamic>)),
          details: $checkedConvert('details', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'id': instance.id,
      'flight_number': instance.flight_number,
      'name': instance.name,
      'date_utc': instance.date_utc,
      'isFavorite': instance.isFavorite,
      'links': instance.links.toJson(),
      'details': instance.details,
    };
