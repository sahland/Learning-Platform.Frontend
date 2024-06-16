import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/api/api.dart';

part 'completed_course_event.dart';
part 'completed_course_state.dart';

class CompletedCourseBloc extends Bloc<CompletedCourseEvent, CompletedCourseState> {
  CompletedCourseBloc({required this.coursesApiClient}) : super(CompletedCourseInitialState()) {
    on<CompletedCourseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final CoursesApiClient coursesApiClient;
}