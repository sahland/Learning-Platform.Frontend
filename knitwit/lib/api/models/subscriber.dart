import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscriber.g.dart';

@JsonSerializable()
class Subscriber extends Equatable {
  const Subscriber({
    required this.userId,
    required this.nickname,
    required this.userAvatarKey,
    required this.courses,
  });

  final int userId;
  final String nickname;
  final String userAvatarKey;
  final List<String> courses;

  factory Subscriber.fromJson(Map<String, dynamic> json) => _$SubscriberFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberToJson(this);

  @override
  List<Object> get props => [userId, nickname, userAvatarKey, courses];
}
