import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/models.dart';

part 'notifications_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class NotificationsApiClient {
  factory NotificationsApiClient(Dio dio, {String baseUrl}) = _NotificationsApiClient;

  factory NotificationsApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return NotificationsApiClient(dio, baseUrl: apiUrl);
    }
    return NotificationsApiClient(dio);
  }

  @GET('/api/v1/notifications/{notificationsId}')
  Future<NotificationModel> getNotificationById(
    @Path('notificationId') int notificationId,
  );

  @GET('/api/v1/notifications/all')
  Future<List<NotificationModel>> getNotifications(
  );

}