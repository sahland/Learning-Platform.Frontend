// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRatings _$CourseRatingsFromJson(Map<String, dynamic> json) =>
    CourseRatings(
      rating: (json['rating'] as List<dynamic>)
          .map((e) => CourseRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseRatingsToJson(CourseRatings instance) =>
    <String, dynamic>{
      'rating': instance.rating,
    };
