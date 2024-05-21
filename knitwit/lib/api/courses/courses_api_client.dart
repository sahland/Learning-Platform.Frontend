import 'package:dio/dio.dart';
import 'package:knitwit/api/models/course.dart';
import 'package:knitwit/api/models/courses.dart';
import 'package:retrofit/http.dart';

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

  @GET('/api/v1/courses/')
  Future<List<Course>> getCourses();
}