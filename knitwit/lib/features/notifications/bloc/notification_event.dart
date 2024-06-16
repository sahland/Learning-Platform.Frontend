part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class NotificationsListEvent extends NotificationEvent {
  const NotificationsListEvent({
    this.completer
  });
  final Completer? completer;

  @override
  List<Object?> get props => super.props..add(completer);
}