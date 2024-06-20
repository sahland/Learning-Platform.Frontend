// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_sections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSections _$CourseSectionsFromJson(Map<String, dynamic> json) =>
    CourseSections(
      section: (json['section'] as List<dynamic>)
          .map((e) => CourseSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseSectionsToJson(CourseSections instance) =>
    <String, dynamic>{
      'section': instance.section,
    };
