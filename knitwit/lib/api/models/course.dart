import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'course.g.dart';

@JsonSerializable()
class Course extends Equatable {
  const Course({
    required this.courseId,
    required this.creator,
    required this.title,
    required this.publishedDate,
    required this.courseAvatarKey,
    required this.sections,
    required this.tags,
    required this.status
  });

  final int courseId;
  final User creator;
  final String title;
  final String publishedDate;
  final String courseAvatarKey;
  final List<CourseSection> sections;
  final List<Tag> tags;
  final String status;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  List<Object> get props => [courseId, creator, title, publishedDate, sections,
                            courseAvatarKey, tags, status];
}