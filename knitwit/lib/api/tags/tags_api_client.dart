import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'tags_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class TagsApiClient {
  factory TagsApiClient(Dio dio, {String baseUrl}) = _TagsApiClient;

  factory TagsApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return TagsApiClient(dio, baseUrl: apiUrl);
    }
    return TagsApiClient(dio);
  }

  @GET('/api/v1/tags/all')
  Future<List<Tag>> getTags();

  @GET('/api/v1/tags/{tagId}')
  Future<Tag> getTagById(
    @Path('tagId') int tagId,
  );

  @GET('/api/v1/tags/name/{tagName}')
  Future<Tag> getTagByName(
    @Path('tagName') String tagName,
  );
}
