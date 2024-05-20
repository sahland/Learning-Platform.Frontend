import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification extends Equatable {
  const Notification({
    required this.notificationId,
    required this.senderId,
    required this.title,
    required this.message,
    required this.createdAt
  });

  final String notificationId;
  final String senderId;
  final String title;
  final String message;
  final String createdAt;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  List<Object> get props => [title ,message];
}