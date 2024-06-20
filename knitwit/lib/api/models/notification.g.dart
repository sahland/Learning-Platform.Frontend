// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      notificationId: (json['notificationId'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
      title: json['title'] as String,
      message: json['message'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'senderId': instance.senderId,
      'title': instance.title,
      'message': instance.message,
      'createdAt': instance.createdAt,
    };
