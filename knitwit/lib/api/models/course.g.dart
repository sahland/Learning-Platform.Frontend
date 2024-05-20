// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      courseId: json['courseId'] as String,
      creator: User.fromJson(json['creator'] as Map<String, dynamic>),
      title: json['title'] as String,
      publishedDate: json['publishedDate'] as String,
      section: (json['section'] as List<dynamic>)
          .map((e) => CourseSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaFile: MediaFile.fromJson(json['mediaFile'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'creator': instance.creator,
      'title': instance.title,
      'publishedDate': instance.publishedDate,
      'section': instance.section,
      'mediaFile': instance.mediaFile,
      'tags': instance.tags,
    };
