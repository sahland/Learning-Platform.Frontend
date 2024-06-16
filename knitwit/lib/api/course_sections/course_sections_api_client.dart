import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'course_sections_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class CourseSectionsApiClient {
  factory CourseSectionsApiClient(Dio dio, {String baseUrl}) = _CourseSectionsApiClient;

  factory CourseSectionsApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return CourseSectionsApiClient(dio, baseUrl: apiUrl);
    }
    return CourseSectionsApiClient(dio);
  }

  // @GET('/api/v1/sections/{sectionId}')
  // Future<Section> getSectionByCourseId(
  //   @Query('sectionId') int sectionId,
  // );
}
