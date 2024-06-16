import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'learning_progress.g.dart';

@JsonSerializable()
class LearningProgress extends Equatable {
  const LearningProgress({
    required this.progressId,
    required this.user,
    required this.section,
    required this.completed,

  });

  final int progressId;
  final String user;
  final CourseSection section;
  final bool completed;

  factory LearningProgress.fromJson(Map<String, dynamic> json) => _$LearningProgressFromJson(json);

  Map<String, dynamic> toJson() => _$LearningProgressToJson(this);

  @override
  List<Object> get props => [progressId, user, section, completed];
}
