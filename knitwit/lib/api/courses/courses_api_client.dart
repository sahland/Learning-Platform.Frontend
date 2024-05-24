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

  @GET('/api/v1/courses')
  Future<Courses> getCourses();

  @GET('/api/v1/courses/{courseId}')
  Future<Course> getCourseById(
    @Query('courseId') int courseId,
  );

  @GET('/api/v1/courses/{courseId}/tags')
  Future<Tags> getTagsByCourseId(
    @Query('courseId') int courseId,
  );

  // @GET('/api/v1/courses/{courseId}/avatar')
  // Future<Avatar> getAvatarByCourseId(
  //  @Query('courseId') int courseId,
  // );

  // @GET('/api/v1/courses/{courseId}/sections')
  // Future<Sections> getSectionsByCourseId(
  //  @Query('courseId') int courseId,
  // );

  @GET('/api/v1/courses/tags/{tagId}')
  Future<Courses> getCoursesByTagId(
    @Query('tagId') int tagId,
  );

  @GET('/api/v1/courses/search')
  Future<Courses> getCoursesBySearch(
    @Query('keyword') String keyword,
  );
  
  @GET('/api/v1/courses/published')
  Future<Courses> getPublishedCourses();

  @GET('/api/v1/courses/createdByUser/{userId}')
  Future<Courses> getCoursesCreatedByUser(
    @Query('userId') int userId,
  );

  @GET('/api/v1/courses/count')
  Future<Courses> getCoursesCount();
}
