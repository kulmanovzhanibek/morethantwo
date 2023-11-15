import 'package:dio/dio.dart';

import '../../const/flavor_config.dart';
import '../../injection_container.dart';
import '../storage/security/security_storage.dart';
import 'dio_interceptor.dart';


class DioClient {
  final Dio _dio;

  Dio get getDio => _dio;

  DioClient(this._dio) {
    _dio.options = options;
    _dio.interceptors.addAll(_interceptors);
  }

  final List<Interceptor> _interceptors = [
    LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
    AuthInterceptor(sl<SecurityStorage>()),
  ];

  final options = BaseOptions(
    baseUrl: FlavorConfig.instance!.values.baseUrl,
    contentType: 'application/json',
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
    sendTimeout: const Duration(milliseconds: 20000),
    responseType: ResponseType.json,
  );
}
