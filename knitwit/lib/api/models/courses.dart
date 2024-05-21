import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'courses.g.dart';

@JsonSerializable()
class Courses extends Equatable {
  const Courses({
    required this.courses,
  });

  final List<Courses> courses;

  factory Courses.fromJson(Map<String, dynamic> json) => _$CoursesFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesToJson(this);

  @override
  List<Object> get props => [courses];
}