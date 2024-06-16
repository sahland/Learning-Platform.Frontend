// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      courseId: (json['courseId'] as num).toInt(),
      creator: User.fromJson(json['creator'] as Map<String, dynamic>),
      title: json['title'] as String,
      publishedDate: json['publishedDate'] as String,
      courseAvatarKey: json['courseAvatarKey'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => CourseSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'creator': instance.creator,
      'title': instance.title,
      'publishedDate': instance.publishedDate,
      'courseAvatarKey': instance.courseAvatarKey,
      'sections': instance.sections,
      'tags': instance.tags,
      'status': instance.status,
    };
