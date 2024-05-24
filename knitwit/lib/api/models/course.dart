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
    required this.sections,
    required this.courseAvatarKey,
    required this.tags,
    required this.subscribers,
    required this.status
  });

  final int courseId;
  final Creator creator;
  final String title;
  final String publishedDate;
  final int sections;
  final String courseAvatarKey;
  final Tags tags;
  final Subscribers subscribers;
  final String status;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  List<Object> get props => [courseId, creator, title, publishedDate, sections,
                            courseAvatarKey, tags, subscribers, status];
}