import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/flavor_config.dart';

@singleton
@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @factoryMethod
  static ApiClient create(FlavorConfig flavorConfig) {
    final Dio dio = Dio(BaseOptions(
        baseUrl: flavorConfig.getBaseUrl(),
        connectTimeout: 30000, //30s
        receiveTimeout: 30000,
        sendTimeout: 30000));

    // TODO find better way for flavours
    if (flavorConfig is ProdFlavorConfig) {
      dio.interceptors
          .add(DioLoggingInterceptor(level: Level.body, compact: false));
    }

    return ApiClient(dio);
  }
}
