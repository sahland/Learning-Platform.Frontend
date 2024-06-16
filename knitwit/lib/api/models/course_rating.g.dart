// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRating _$CourseRatingFromJson(Map<String, dynamic> json) => CourseRating(
      ratingId: (json['ratingId'] as num).toInt(),
      user: json['user'] as String,
      course: json['course'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$CourseRatingToJson(CourseRating instance) =>
    <String, dynamic>{
      'ratingId': instance.ratingId,
      'user': instance.user,
      'course': instance.course,
      'value': instance.value,
    };
