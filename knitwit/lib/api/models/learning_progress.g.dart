// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningProgress _$LearningProgressFromJson(Map<String, dynamic> json) =>
    LearningProgress(
      progressId: (json['progressId'] as num).toInt(),
      user: json['user'] as String,
      section: CourseSection.fromJson(json['section'] as Map<String, dynamic>),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$LearningProgressToJson(LearningProgress instance) =>
    <String, dynamic>{
      'progressId': instance.progressId,
      'user': instance.user,
      'section': instance.section,
      'completed': instance.completed,
    };
