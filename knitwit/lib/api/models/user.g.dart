// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: (json['userId'] as num).toInt(),
      username: json['username'] as String,
      nickname: json['nickname'] as String,
      avatarKey: json['avatarKey'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'avatarKey': instance.avatarKey,
      'email': instance.email,
      'nickname': instance.nickname,
    };
