import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class NotificationModel extends Equatable {
  const NotificationModel({
    required this.notificationId,
    required this.senderId,
    required this.title,
    required this.message,
    required this.createdAt
  });

  final int notificationId;
  final int senderId;
  final String title;
  final String message;
  final String createdAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  @override
  List<Object> get props => [notificationId, senderId, title, message, createdAt];
}