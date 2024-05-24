import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'creator.g.dart';

@JsonSerializable()
class Creator extends Equatable {
  const Creator({
    required this.userId,
    required this.nickname,
    required this.userAvatarKey,
    required this.courses,
    required this.learningProgresses,
    required this.ratings,

  });

  final int userId;
  final String nickname;
  final String userAvatarKey;
  final List<String> courses;
  final LearningProgresses learningProgresses;
  final Ratings ratings;

  factory Creator.fromJson(Map<String, dynamic> json) => _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);

  @override
  List<Object> get props => [userId, nickname, userAvatarKey, courses];
}

