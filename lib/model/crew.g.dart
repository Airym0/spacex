// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crew _$CrewFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Crew',
      json,
      ($checkedConvert) {
        final val = Crew(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          agency: $checkedConvert('agency', (v) => v as String),
          image: $checkedConvert('image', (v) => v as String),
          wikipedia: $checkedConvert('wikipedia', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'agency': instance.agency,
      'image': instance.image,
      'wikipedia': instance.wikipedia,
      'status': instance.status,
    };
