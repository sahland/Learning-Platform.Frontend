import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/course.dart';

part 'course_section.g.dart';

@JsonSerializable()
class CourseSection extends Equatable {
  const CourseSection({
    required this.sectionId,
    required this.course,
    required this.content,
    required this.sectionsNumber,
  });

  final String sectionId;
  final Course course;
  final String content;
  final int sectionsNumber;

  factory CourseSection.fromJson(Map<String, dynamic> json) => _$CourseSectionFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSectionToJson(this);

  @override
  List<Object> get props => [content];
}