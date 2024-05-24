import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifications extends Equatable {
  const Notifications({
    required this.notification
  });

  final List<Notification> notification;

  factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);

  @override
  List<Object> get props => [notification];
}
