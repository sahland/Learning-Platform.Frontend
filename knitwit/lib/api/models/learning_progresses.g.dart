// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_progresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningProgresses _$LearningProgressesFromJson(Map<String, dynamic> json) =>
    LearningProgresses(
      learningProgress: (json['learningProgress'] as List<dynamic>)
          .map((e) => LearningProgress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LearningProgressesToJson(LearningProgresses instance) =>
    <String, dynamic>{
      'learningProgress': instance.learningProgress,
    };
