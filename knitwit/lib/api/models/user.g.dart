// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: (json['userId'] as num).toInt(),
      nickname: json['nickname'] as String,
      userAvatarKey: json['userAvatarKey'] as String,
      courses:
          (json['courses'] as List<dynamic>).map((e) => e as String).toList(),
      learningProgresses: LearningProgresses.fromJson(
          json['learningProgresses'] as Map<String, dynamic>),
      ratings: Ratings.fromJson(json['ratings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'userAvatarKey': instance.userAvatarKey,
      'courses': instance.courses,
      'learningProgresses': instance.learningProgresses,
      'ratings': instance.ratings,
    };
