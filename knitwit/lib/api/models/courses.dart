import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'courses.g.dart';

@JsonSerializable()
class Courses extends Equatable {
  const Courses({
    required this.course
  });

  final List<Course> course;

  factory Courses.fromJson(Map<String, dynamic> json) => _$CoursesFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesToJson(this);

  @override
  List<Object> get props => [course];
}

