import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/api/api.dart';

part 'favorite_course_event.dart';
part 'favorite_course_state.dart';

class FavoriteCourseBloc extends Bloc<FavoriteCourseEvent, FavoriteCourseState> {
  final UsersApiClient usersApiClient;
  final CoursesApiClient coursesApiClient;

  FavoriteCourseBloc({
    required this.usersApiClient,
    required this.coursesApiClient
  }) : super(FavoriteCourseInitialState()) {
    on<SubscribedCoursesEvent>(_onSubscribedCourses);
  }

  Future<void> _onSubscribedCourses(
    SubscribedCoursesEvent event,
    Emitter<FavoriteCourseState> emit
    ) async {
      try {
        if(state is FavoriteCourseLoadedState) {
          emit(FavoriteCourseLoadingState());
        }
        final subscribedCourses = await usersApiClient.subscribedCourses();
        emit(FavoriteCourseLoadedState(subscribedCourses: subscribedCourses));
      } catch (e) {
        emit(FavoriteCourseFailureState(e));
      } finally {
        event.completer?.complete();
      }
    }
}