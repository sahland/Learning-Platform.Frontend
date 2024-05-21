import 'package:dio/dio.dart';
import 'package:knitwit/api/models/sections.dart';
import 'package:retrofit/http.dart';

part 'sections_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class SectionsApiClient {
  factory SectionsApiClient(Dio dio, {String baseUrl}) = _SectionsApiClient;

  factory SectionsApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return SectionsApiClient(dio, baseUrl: apiUrl);
    }
    return SectionsApiClient(dio);
  }

  @GET('/api/v1/sections/')
  Future<List<Sections>> getSections();
}