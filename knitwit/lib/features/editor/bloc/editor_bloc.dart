import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/api/tags/tags_api_client.dart';

import '../../../api/api.dart';

part 'editor_event.dart';
part 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final CoursesApiClient coursesApiClient;
  final TagsApiClient tagsApiClient;
  final UsersApiClient usersApiClient;
  
  EditorBloc({
    required this.coursesApiClient,
    required this.tagsApiClient,
    required this.usersApiClient
  }) : super(EditorLoading()) {
    on<ViewTagsEvent>(_onShowAllTags);
    on<CreateCourseEvent>(_onCreateCourse);
    on<EditorInitEvent>(_onInit);
  }

  Future<void> _onShowAllTags(ViewTagsEvent event, Emitter<EditorState> emit) async {
    log('ViewTagsEvent triggered');
    try {
      final blocAllTags = await tagsApiClient.getTags();
      log('Tags fetched successfully: $blocAllTags');
      if (state is EditorLoaded) {
        emit(EditorLoaded(
          blocAllTags: blocAllTags,
          blocCourse: (state as EditorLoaded).blocCourse
        ));
      }
    } catch (e) {
      log('Error fetching tags: $e');
      emit(EditorFailure(e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onCreateCourse(CreateCourseEvent event, Emitter<EditorState> emit) async {
    log('CreateCourseEvent triggered with text: ${event.text}');
    emit(EditorLoading());
    try {
      await coursesApiClient.createCourse(event.text, event.file);
      log('Course created successfully');
      emit(EditorInitial());
    } catch (e) {
      log('Error creating course: $e');
      emit(EditorFailure(e));
    }
  }

     Future<void> _onInit(EditorInitEvent event, Emitter<EditorState> emit) async {
    log('EditorInitEvent triggered');
    try {
      emit(EditorLoading());
      final editorTags = await tagsApiClient.getTags();
      final user = await usersApiClient.authProfile();
      log('Tags fetched successfully on init: $editorTags');
      // Создаем пустой курс, чтобы избежать ошибки приведения типа
      final editorCourse = Course(
        courseId: 0,
        creator: user, // Создайте пример пользователя или измените его на необходимого
        title: '',
        publishedDate: '',
        courseAvatarKey: '',
        sections: [],
        tags: [],
        status: 'draft'
      );
      emit(EditorLoaded(
        blocCourse: editorCourse,
        blocAllTags: editorTags
      ));
    } catch (e) {
      log('Error initializing editor: $e');
      emit(EditorFailure(e));
    } finally {
      event.completer?.complete();
    }
  }
}


