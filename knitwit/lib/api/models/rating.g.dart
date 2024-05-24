// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      ratingId: (json['ratingId'] as num).toInt(),
      user: json['user'] as String,
      course: json['course'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'ratingId': instance.ratingId,
      'user': instance.user,
      'course': instance.course,
      'value': instance.value,
    };
