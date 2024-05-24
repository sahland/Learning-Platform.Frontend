import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
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


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [userId, nickname, userAvatarKey,
                           courses, learningProgresses, ratings];
}