import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api.dart';

part 'module_event.dart';
part 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final CoursesApiClient _coursesApiClient;

  ModuleBloc({
    required CoursesApiClient coursesApiClient
  }) :  _coursesApiClient = coursesApiClient,
        super(ModuleInitialState()) {
    on<FetchSectionByIdEvent>(_fetchSectionById);
  }

  Future<void> _fetchSectionById(
    FetchSectionByIdEvent event,
    Emitter<ModuleState> emit
  ) async {
    emit(ModuleLoadingState());
    log('Fetching section with course ID: ${event.courseId} and section ID: ${event.sectionId}');
    try {
      final section = await _coursesApiClient.getSectionById(event.courseId, event.sectionId);
      emit(ModuleLoadedState(blocSection: section));
      log('Section fetched: ${section}');
    } catch (error) {
      log('Error fetching section: ${error}');
      if (error is DioError) {
        log('Request URL: ${error.requestOptions.uri}');
        log('Request headers: ${error.requestOptions.headers}');
        log('Request data: ${error.requestOptions.data}');
        log('Response data: ${error.response?.data}');
      }
      emit(ModuleFailureState(error));
    } finally {
      event.completer?.complete();
    }
  }
}


