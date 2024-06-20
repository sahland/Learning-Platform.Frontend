import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/api/api.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationsApiClient notificationsApiClient;

  NotificationBloc({
    required this.notificationsApiClient
    }) : super(NotificationInitial()) {
    on<NotificationsListEvent>(_onNotifications);
  }

  Future<void> _onNotifications(NotificationsListEvent event, Emitter<NotificationState> emit) async {
    try {
      if (state is NotificationLoaded) {
        emit(NotificationLoading());
      }
      final notificationsList = await notificationsApiClient.getNotifications();
      log('Block Try in NotificationBloc(_onNotifications): ${notificationsList.toString()}');
      emit(NotificationLoaded(blocNotifications: notificationsList));
    } catch (e) {
      log('Block Catch in NotificationBloc(_onNotifications): '+e.toString());
      emit(NotificationFailure(e));
    }
    finally {
      event.completer?.complete();
    }
  }
}