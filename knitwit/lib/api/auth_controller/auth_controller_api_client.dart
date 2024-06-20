import 'package:dio/dio.dart';
import 'package:knitwit/api/models/token.dart';
import 'package:retrofit/http.dart';

import '../models/models.dart';

part 'auth_controller_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class AuthControllerApiClient {
  factory AuthControllerApiClient(Dio dio, {String baseUrl}) = _AuthControllerApiClient;

  factory AuthControllerApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return AuthControllerApiClient(dio, baseUrl: apiUrl);
    }
    return AuthControllerApiClient(dio);
  }

  @POST('/auth')
  Future<Token> auth(
    @Body() Auth auth,
    {
      @Header('Content-Type') String type = 'application/json'
    }
  );

  @POST('/registration')
  Future<Registration> registration(
    @Field('username') String username,
    @Field('email') String email,
    @Field('password') String password,
    @Field('confirmPassword') String confirmPassword,
  );

}