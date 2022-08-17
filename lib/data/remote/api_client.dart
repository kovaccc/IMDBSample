import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:imdb_sample/config/constants.dart';
import 'package:imdb_sample/data/models/responses/genres_response.dart';
import 'package:imdb_sample/data/models/responses/popular_movies_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/flavor_config.dart';

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

    // TODO find better way for flavours and test this
    if (flavorConfig is! ProdFlavorConfig) {
      dio.interceptors
          .add(DioLoggingInterceptor(level: Level.body, compact: false));
    }

    return ApiClient(dio);
  }

  @GET("/3/movie/popular")
  Future<PopularMoviesResponse> getSimplePopularMovies({
    @Query("api_key") String apiKey = Constants.apiKey,
    @Query("language") String language = Constants.languageUS,
    @Query("page") int page,
  });

  @GET("/3/genre/movie/list")
  Future<GenresResponse> getGenres([
    @Query("api_key") String apiKey = Constants.apiKey,
  ]);
}
