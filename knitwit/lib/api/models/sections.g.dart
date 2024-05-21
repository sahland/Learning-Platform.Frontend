// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sections _$SectionsFromJson(Map<String, dynamic> json) => Sections(
      sections: (json['sections'] as List<dynamic>)
          .map((e) => CourseSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionsToJson(Sections instance) => <String, dynamic>{
      'sections': instance.sections,
    };
