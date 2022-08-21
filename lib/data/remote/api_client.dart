import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:imdb_sample/config/constants.dart';
import 'package:imdb_sample/data/local/dao/auth_dao.dart';
import 'package:imdb_sample/data/models/responses/genres_response.dart';
import 'package:imdb_sample/data/models/responses/popular_movies_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/flavor_config.dart';
import '../../config/secrets.dart';
import '../../di/injection.dart';

part 'api_client.g.dart';

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

    if (flavorConfig is! ProdFlavorConfig) {
      dio.interceptors
          .add(DioLoggingInterceptor(level: Level.body, compact: false));
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestBuilder, handler) {
          final authDao = getIt<AuthDao>();
          final token = authDao.getJwtToken();
          if (token != null && token != "") {
            requestBuilder.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(requestBuilder);
        },
      ),
    );

    return ApiClient(dio);
  }

  @GET("/3/movie/popular")
  Future<PopularMoviesResponse> getPopularMovies(@Query("page") int page,
      [@Query("api_key") String apiKey = Secrets.apiKey,
      @Query("language") String language = Constants.languageUS]);

  @GET("/3/genre/movie/list")
  Future<GenresResponse> getGenres([
    @Query("api_key") String apiKey = Secrets.apiKey,
  ]);
}
