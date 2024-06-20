import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/api/api.dart';

part 'my_courses_event.dart';
part 'my_courses_state.dart';

class MyCoursesBloc extends Bloc<MyCoursesEvent, MyCoursesState> {
  final CoursesApiClient coursesApiClient;

  MyCoursesBloc({required this.coursesApiClient}) : super(MyCoursesLoadingState()) {
    on<GetUserCoursesEvent>(_onGetUserCourses);
  }

  Future<void> _onGetUserCourses(
    GetUserCoursesEvent event,
    Emitter<MyCoursesState> emit,
  ) async {
    emit(MyCoursesLoadingState());
    try {
      final courses = await coursesApiClient.getCourseById(event.userId);
      //emit(MyCoursesLoadedState(blocMyCourses: lis));
    } catch (error) {
      emit(MyCoursesFailureState(error));
    } finally {
      event.completer?.complete();
    }
  }
}
