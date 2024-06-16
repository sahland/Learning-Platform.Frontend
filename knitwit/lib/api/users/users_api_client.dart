import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:knitwit/api/auth_controller/token_interceptor.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'users_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class UsersApiClient {
  factory UsersApiClient(Dio dio, {String baseUrl}) = _UsersApiClient;

  factory UsersApiClient.create({String? apiUrl}) {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor(storage: FlutterSecureStorage()));
    if (apiUrl != null) {
      return UsersApiClient(dio, baseUrl: apiUrl);
    }
    return UsersApiClient(dio);
  }

  @GET('/api/v1/users/profile')
  Future<User> authProfile();

  @PUT('/api/v1/users/{userId}')
  Future<User> redactUser(
    @Path('userId') int userId
  );
}