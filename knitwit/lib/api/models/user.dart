import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User extends Equatable {
  const User({
    required this.userId,
    required this.username,
    required this.nickname,
    this.avatarKey,
    required this.email,
  });

  final int userId;
  final String username;
  final String? avatarKey;
  final String email;
  final String nickname;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [userId, username, avatarKey, email, nickname];
}
