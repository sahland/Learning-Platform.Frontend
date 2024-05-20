// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSection _$CourseSectionFromJson(Map<String, dynamic> json) =>
    CourseSection(
      sectionId: json['sectionId'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      content: json['content'] as String,
      sectionsNumber: (json['sectionsNumber'] as num).toInt(),
    );

Map<String, dynamic> _$CourseSectionToJson(CourseSection instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'course': instance.course,
      'content': instance.content,
      'sectionsNumber': instance.sectionsNumber,
    };
