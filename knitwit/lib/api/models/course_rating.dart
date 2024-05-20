import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/course.dart';
import 'package:knitwit/api/models/user.dart';

part 'course_rating.g.dart';

@JsonSerializable()
class CourseRating extends Equatable {
  const CourseRating({
    required this.ratingId,
    required this.user,
    required this.course,
    required this.value
  });

  final String ratingId;
  final User user;
  final Course course;
  final int value;

  factory CourseRating.fromJson(Map<String, dynamic> json) => _$CourseRatingFromJson(json);

  Map<String, dynamic> toJson() => _$CourseRatingToJson(this);

  @override
  List<Object> get props => [value];
}