import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'course_sections.g.dart';

@JsonSerializable()
class CourseSections extends Equatable {
  const CourseSections({
    required this.section
  });

  final List<CourseSection> section;

  factory CourseSections.fromJson(Map<String, dynamic> json) => _$CourseSectionsFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSectionsToJson(this);

  @override
  List<Object> get props => [section];
}