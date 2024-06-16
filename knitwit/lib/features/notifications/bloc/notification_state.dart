part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationLoaded extends NotificationState {
  const NotificationLoaded({
    required this.blocNotifications
  });
  final List<NotificationModel> blocNotifications;

  @override
  List<Object> get props => super.props..addAll([blocNotifications]);
}

final class NotificationFailure extends NotificationState {
  const NotificationFailure(this.error);
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}