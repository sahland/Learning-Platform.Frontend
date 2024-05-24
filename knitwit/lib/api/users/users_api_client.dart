import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'users_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class UsersApiClient {
  factory UsersApiClient(Dio dio, {String baseUrl}) = _UsersApiClient;

  factory UsersApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return UsersApiClient(dio, baseUrl: apiUrl);
    }
    return UsersApiClient(dio);
  }

  @GET('/api/v1/users')
  Future<Users> getUsers();

  @GET('/api/v1/users/{userId}')
  Future<User> getUserById(
    @Query('userId') int userId,
  );

  // @GET('/api/v1/users/{userId}/avatar')
  // Future<Avatar> getUserAvatar(
  //   @Query('userId') int userId,
  // );

  @GET('/api/v1/users/{userId}/courses')
  Future<Users> getSubscibedCourses(
    @Query('userId') int userId,
  );

}