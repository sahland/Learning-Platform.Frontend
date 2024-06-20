import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'learning_progresses.g.dart';

@JsonSerializable()
class LearningProgresses extends Equatable {
  const LearningProgresses({
    required this.learningProgress
  });

  final List<LearningProgress> learningProgress;

  factory LearningProgresses.fromJson(Map<String, dynamic> json) => _$LearningProgressesFromJson(json);

  Map<String, dynamic> toJson() => _$LearningProgressesToJson(this);

  @override
  List<Object> get props => [learningProgress];
}