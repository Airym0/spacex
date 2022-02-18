// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Links',
      json,
      ($checkedConvert) {
        final val = Links(
          website: $checkedConvert('website', (v) => v as String),
          flickr: $checkedConvert('flickr', (v) => v as String),
          twitter: $checkedConvert('twitter', (v) => v as String),
          elon_twitter: $checkedConvert('elon_twitter', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'website': instance.website,
      'flickr': instance.flickr,
      'twitter': instance.twitter,
      'elon_twitter': instance.elon_twitter,
    };
