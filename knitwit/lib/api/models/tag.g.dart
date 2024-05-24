// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      tagId: (json['tagId'] as num).toInt(),
      tagName: json['tagName'] as String,
      courses:
          (json['courses'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'tagId': instance.tagId,
      'tagName': instance.tagName,
      'courses': instance.courses,
    };
