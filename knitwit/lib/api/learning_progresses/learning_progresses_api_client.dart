import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'learning_progresses_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class LearningProgressesApiClient {
  factory LearningProgressesApiClient(Dio dio, {String baseUrl}) = _LearningProgressesApiClient;

  factory LearningProgressesApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return LearningProgressesApiClient(dio, baseUrl: apiUrl);
    }
    return LearningProgressesApiClient(dio);
  }

  // @GET('/api/v1/progress/{userId}/course/{courseId}/completion')
  // Future<-> getTagById(
  //   @Query('userId') int userId,
  //   @Query('courseId') int courseId,
  // );
}