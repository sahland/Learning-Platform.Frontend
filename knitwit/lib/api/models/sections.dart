import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/course_section.dart';

part 'sections.g.dart';

@JsonSerializable()
class Sections extends Equatable {
  const Sections({
    required this.sections,
  });

  final List<CourseSection> sections;

  factory Sections.fromJson(Map<String, dynamic> json) => _$SectionsFromJson(json);

  Map<String, dynamic> toJson() => _$SectionsToJson(this);

  @override
  List<Object> get props => [sections];
}