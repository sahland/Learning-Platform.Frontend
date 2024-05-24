// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      courseId: (json['courseId'] as num).toInt(),
      creator: Creator.fromJson(json['creator'] as Map<String, dynamic>),
      title: json['title'] as String,
      publishedDate: json['publishedDate'] as String,
      sections: (json['sections'] as num).toInt(),
      courseAvatarKey: json['courseAvatarKey'] as String,
      tags: Tags.fromJson(json['tags'] as Map<String, dynamic>),
      subscribers:
          Subscribers.fromJson(json['subscribers'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'creator': instance.creator,
      'title': instance.title,
      'publishedDate': instance.publishedDate,
      'sections': instance.sections,
      'courseAvatarKey': instance.courseAvatarKey,
      'tags': instance.tags,
      'subscribers': instance.subscribers,
      'status': instance.status,
    };
