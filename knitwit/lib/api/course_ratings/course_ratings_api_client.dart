import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'course_ratings_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class CourseRatingsApiClient {
  factory CourseRatingsApiClient(Dio dio, {String baseUrl}) = _CourseRatingsApiClient;

  factory CourseRatingsApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return CourseRatingsApiClient(dio, baseUrl: apiUrl);
    }
    return CourseRatingsApiClient(dio);
  }

  @GET('/api/v1/ratings/user/{userId}/ratings')
  Future<CourseRatings> getRatingsByUserId(
    @Path('userId') int userId,
  );

  @GET('/api/v1/ratings/course/{courseId}/ratings')
  Future<CourseRatings> getCourseRatings(
    @Path('courseId') int courseId,
  );

  // @GET('/api/v1/ratings/course/{courseId}/average-ratings')
  // Future<Ratings> getCourseAverageRatings(
  //   @Path('courseId') int courseId,
  // );

}