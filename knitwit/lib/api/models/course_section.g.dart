// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSection _$CourseSectionFromJson(Map<String, dynamic> json) =>
    CourseSection(
      sectionId: (json['sectionId'] as num).toInt(),
      courseId: (json['courseId'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      sectionNumber: (json['sectionNumber'] as num).toInt(),
    );

Map<String, dynamic> _$CourseSectionToJson(CourseSection instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'courseId': instance.courseId,
      'title': instance.title,
      'content': instance.content,
      'sectionNumber': instance.sectionNumber,
    };
