// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) => Subscriber(
      userId: (json['userId'] as num).toInt(),
      nickname: json['nickname'] as String,
      userAvatarKey: json['userAvatarKey'] as String,
      courses:
          (json['courses'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubscriberToJson(Subscriber instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'userAvatarKey': instance.userAvatarKey,
      'courses': instance.courses,
    };
