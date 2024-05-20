// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      notificationId: json['notificationId'] as String,
      senderId: json['senderId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'senderId': instance.senderId,
      'title': instance.title,
      'message': instance.message,
      'createdAt': instance.createdAt,
    };
