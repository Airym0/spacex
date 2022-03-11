// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landpad _$LandpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Landpad',
      json,
      ($checkedConvert) {
        final val = Landpad(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          full_name: $checkedConvert('full_name', (v) => v as String),
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LandpadToJson(Landpad instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.full_name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
