import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_section.g.dart';

@JsonSerializable()
class CourseSection extends Equatable {
  const CourseSection({
    required this.sectionId,
    required this.courseId,
    required this.title,
    required this.content,
    required this.sectionNumber
  });

  final int sectionId;
  final int courseId;
  final String title;
  final String content;
  final int sectionNumber;

  factory CourseSection.fromJson(Map<String, dynamic> json) => _$CourseSectionFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSectionToJson(this);

  @override
  List<Object> get props => [sectionId, courseId, title, content, sectionNumber];
}