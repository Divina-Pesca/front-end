import 'package:dio/dio.dart';
import 'package:divina_pesca/constants_config.dart';

class DioClient {
  Dio dio = Dio(
      BaseOptions(connectTimeout: 5000, sendTimeout: 5000, baseUrl: kapiUrl));

  static final DioClient _dioClient = DioClient._internal();

  factory DioClient() {
    _dioClient.dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final String token = await storage.read(key: "token");
      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
      }
      return handler.next(options);
    }));
    return _dioClient;
  }

  DioClient._internal();
}
