// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      sectionId: (json['sectionId'] as num).toInt(),
      courseId: (json['courseId'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      sectionNumber: (json['sectionNumber'] as num).toInt(),
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'sectionId': instance.sectionId,
      'courseId': instance.courseId,
      'title': instance.title,
      'content': instance.content,
      'sectionNumber': instance.sectionNumber,
    };
