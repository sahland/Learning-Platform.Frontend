import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/course_section.dart';
import 'package:knitwit/api/models/media_file.dart';
import 'package:knitwit/api/models/tag.dart';
import 'package:knitwit/api/models/user.dart';

part 'course.g.dart';

@JsonSerializable()
class Course extends Equatable {
  const Course({
  required this.courseId,
  required this.creator,
  required this.title,
  required this.publishedDate,
  required this.section,
  required this.mediaFile,
  required this.tags,
  });

  final String courseId;
  final User creator;
  final String title;
  final String publishedDate;
  final List<CourseSection> section;
  final MediaFile mediaFile;
  final List<Tag> tags;
  //final CourseStatus status;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  List<Object> get props => [creator, title, publishedDate, section, mediaFile, tags];
}