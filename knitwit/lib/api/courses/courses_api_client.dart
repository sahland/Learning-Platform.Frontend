import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'courses_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class CoursesApiClient {
  factory CoursesApiClient(Dio dio, {String baseUrl}) = _CoursesApiClient;

  factory CoursesApiClient.create({String? apiUrl}) {
    final dio = Dio();
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
  Future<Tags> getTagsByCourseId(
    @Path('courseId') int courseId,
  );

  // @GET('/api/v1/courses/{courseId}/avatar')
  // Future<String> getAvatarByCourseId(
  //  @Path('courseId') int courseId,
  // );

  // @GET('/api/v1/courses/{courseId}/sections')
  // Future<Sections> getSectionsByCourseId(
  //  @Path('courseId') int courseId,
  // );

  @GET('/api/v1/courses/tags/{tagId}')
  Future<List<Course>> getCoursesByTagId(
    @Path('tagId') int tagId,
  );

  @GET('/api/v1/courses/search')
  Future<List<Course>> getCoursesBySearch(
    @Query('keyword') String keyword,
  );

  //запрос всех подтвержденных курсов
  @GET('/api/v1/courses/published')
  Future<List<Course>> getPublishedCourses();

  @GET('/api/v1/courses/createdByUser/{userId}')
  Future<Courses> getCoursesCreatedByUser(
    @Path('userId') int userId,
  );

  @GET('/api/v1/courses/count')
  Future<Courses> getCoursesCount();

  @PUT('/api/v1/courses/{courseId}')
  Future<Course> updateCourseById(
    @Path() int courseId,
    @Body() Courses courses
  );

  // @PUT('/api/v1/courses/{courseId}/sections/{sectionId}')
  // Future<Section> updateSection(
  //   @Path('courseId') int courseId,
  //   @Path('sectionId') int sectionId,
  // );

  // @DELETE('/api/v1/courses/{courseId}/sections/{sectionId}')
  // Future<void> deleteSection(
  //   @Path() int courseId,
  //   @Path() int sectionId,
  // );

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
