import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'course_ratings.g.dart';

@JsonSerializable()
class CourseRatings extends Equatable {
  const CourseRatings({
    required this.rating
  });

  final List<CourseRating> rating;

  factory CourseRatings.fromJson(Map<String, dynamic> json) => _$CourseRatingsFromJson(json);

  Map<String, dynamic> toJson() => _$CourseRatingsToJson(this);

  @override
  List<Object> get props => [rating];
}