// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Courses _$CoursesFromJson(Map<String, dynamic> json) => Courses(
      courses: (json['courses'] as List<dynamic>)
          .map((e) => Courses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoursesToJson(Courses instance) => <String, dynamic>{
      'courses': instance.courses,
    };
