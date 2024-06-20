import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:knitwit/api/api.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'courses_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class CoursesApiClient {
  factory CoursesApiClient(Dio dio, {String baseUrl}) = _CoursesApiClient;

  factory CoursesApiClient.create({String? apiUrl}) {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor(storage: const FlutterSecureStorage()));
    if (apiUrl != null) {
      return CoursesApiClient(dio, baseUrl: apiUrl);
    }
    return CoursesApiClient(dio);
  }

  //Запрос на весь список курсов, даже не подтверждённых
  @GET('/api/v1/courses')
  Future<List<Course>> getCourses();

  @GET('/api/v1/courses/{courseId}')
  Future<Course> getCourseById(
    @Path('courseId') int courseId,
  );

  @GET('/api/v1/courses/{courseId}/tags')
  Future<List<Tag>> getTagsByCourseId(
    @Path('courseId') int courseId,
  );

  @GET('/api/v1/courses/{courseId}/sections')
  Future<List<Section>> getSectionsByCourseId(
    @Path('courseId') int courseId
  );

 @GET('/api/v1/courses/{courseId}/sections/{sectionId}')
  Future<Section> getSectionById(
    @Path('courseId') int courseId,
    @Path('sectionId') int sectionId
  );

  @GET('/api/v1/courses/tags/{tagId}')
  Future<List<Course>> getCoursesByTagId(
    @Path('tagId') int tagId,
  );

  @GET('/api/v1/courses/search')
  Future<List<Course>> getCoursesBySearch(
    @Query('keyword') String keyword,
  );

  @GET('/api/v1/courses/published')
  Future<List<Course>> getPublishedCourses();

  @GET('/api/v1/courses/createdByUser/{userId}')
  Future<List<Course>> getCoursesCreatedByUser(
    @Path('userId') int userId,
  );

  @GET('/api/v1/courses/count')
  Future<Courses> getCoursesCount();

  @POST('/api/v1/courses')
  @MultiPart()
  Future<void> createCourse(
    @Part(name: 'text') String text,
    @Part(name: 'file') File file
  );
  
  @POST('/api/v1/courses/{courseId}/subscribe')
  Future<Course> subscribeCourse(
    @Part(name: 'courseId') int courseId 
  );

  @PUT('/api/v1/courses/{courseId}')
  Future<Course> updateCourseById(
    @Path() int courseId,
    @Body() Courses courses
  );

  @DELETE('/api/v1/courses/{courseId}/tags')
  Future<void> deleteTags(
    @Path() int courseId,
  );

  @DELETE('/api/v1/courses/{courseId}/unsubscribe/{userId}')
  Future<void> unsubscribeTags(
    @Path() int courseId,
    @Path() int userId,
  );
}
