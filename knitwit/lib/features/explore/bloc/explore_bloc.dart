import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/api/api.dart';
import 'package:knitwit/api/tags/tags_api_client.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final CoursesApiClient coursesApiClient;
  final TagsApiClient tagsApiClient;

  ExploreBloc({
    required this.coursesApiClient,
    required this.tagsApiClient,
  }) : super(ExploreInitial()) {
    on<ExploreInit>(_onInit);
    on<ExploreTags>(_onTags);
    on<ExploreAllCourses>(_onAllCourses);
  }

  Future<void> _onInit(ExploreInit event, Emitter<ExploreState> emit) async {
    try {
      emit(ExploreLoading());
      final exploreTags = await tagsApiClient.getTags();
      final exploreAllCourses = await coursesApiClient.getPublishedCourses();
      emit(ExploreLoaded(
        blocTags: exploreTags,
        blocAllCourses: exploreAllCourses,
      ));
    } catch (e) {
      emit(ExploreFailure(e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onTags(ExploreTags event, Emitter<ExploreState> emit) async {
    try {
      final exploreTags = await tagsApiClient.getTags();
      if (state is ExploreLoaded) {
        emit(ExploreLoaded(
          blocTags: exploreTags,
          blocAllCourses: (state as ExploreLoaded).blocAllCourses,
        ));
      }
    } catch (e) {
      emit(ExploreFailure(e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onAllCourses(ExploreAllCourses event, Emitter<ExploreState> emit) async {
    try {
      final exploreAllCourses = await coursesApiClient.getPublishedCourses();
      if (state is ExploreLoaded) {
        emit(ExploreLoaded(
          blocTags: (state as ExploreLoaded).blocTags,
          blocAllCourses: exploreAllCourses,
        ));
      }
    } catch (e) {
      emit(ExploreFailure(e));
    } finally {
      event.completer?.complete();
    }
  }
}




// Future<void> _onSearch(SearchCourses event, Emitter<ExploreState> emit,) async {
  //   try {
  //     if (state is ExploreLoaded) {
  //       emit(ExploreLoading());
  //     }
  //     //final coursesSearch = await coursesApiClient.getCoursesBySearch(event.keyword);
  //     final exploreTags = await tagsApiClient.getTags();
  //     //log('Block Try in ExploreBloc(_onSearch): ${coursesSearch.toString()}');
  //     //emit(ExploreLoaded(courses: coursesSearch, blocTags: exploreTags));
  //   } catch (e) {
  //     //log('Block Catch in ExploreBloc(_onSearch): '+e.toString());
  //     emit(ExploreFailure(e));
  //   }
  //   finally {
  //     event.completer?.complete();
  //   }
  // }
