import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@JsonSerializable()
class Section extends Equatable {
  const Section({
    required this.sectionId,
    required this.courseId,
    required this.title,
    required this.content,
    required this.sectionNumber,
  });
  final int sectionId;
  final int courseId;
  final String title;
  final String content;
  final int sectionNumber;

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);

  @override
  List<Object> get props => [title, content, sectionId, sectionNumber, courseId];
}
