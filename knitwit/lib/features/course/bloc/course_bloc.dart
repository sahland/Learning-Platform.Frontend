import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:knitwit/api/api.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({
    required FlutterSecureStorage storage,
    required CoursesApiClient courseApiClient,
  }) :  _storage = storage,
        _coursesApiClient = courseApiClient,
        super(CourseInitialState()) {
    on<FetchCourseByIdEvent>(_fetchCourseById);
    on<SubscribeCourseEvent>(_subscribeCourse);
  }

  final CoursesApiClient _coursesApiClient;
  final FlutterSecureStorage _storage;

  Future<void> _fetchCourseById(FetchCourseByIdEvent event, Emitter<CourseState> emit) async {
    emit(CourseLoadingState());
    try {
      final course = await _coursesApiClient.getCourseById(event.courseId);
      emit(CourseLoadedState(course: course));
    } catch (error) {
      emit(CourseFailureState(error));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _subscribeCourse(SubscribeCourseEvent event, Emitter<CourseState> emit) async {
    try {
      final course = await _coursesApiClient.subscribeCourse(event.courseId);
      emit(CourseSubscribedState(course: course));
    } catch (error) {
      emit(CourseFailureState(error));
    } finally {
      event.completer?.complete();
    }
  }
}


