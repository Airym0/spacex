// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksLaunch _$LinksLaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'LinksLaunch',
      json,
      ($checkedConvert) {
        final val = LinksLaunch(
          patch: $checkedConvert(
              'patch', (v) => Patch.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$LinksLaunchToJson(LinksLaunch instance) =>
    <String, dynamic>{
      'patch': instance.patch.toJson(),
    };
