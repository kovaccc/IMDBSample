import 'package:imdb_sample/data/local/dao/auth_dao.dart';
import 'package:imdb_sample/data/models/responses/popular_movies_response.dart';
import 'package:imdb_sample/data/remote/api_client.dart';
import 'package:imdb_sample/util/error_handler.dart';
import 'package:injectable/injectable.dart';

import '../../../common/base/base_remote_data_source.dart';

@singleton
class MoviesRemoteDataSource extends BaseRemoteDataSource {
  final ApiClient _apiClient;

  MoviesRemoteDataSource(this._apiClient, AuthDao authDao) : super(authDao);

  Future<PopularMoviesResponse> getPopularMovies(int page) async {
    return await apiRequest(
        apiCall: _apiClient.getPopularMovies(page),
        errorResolver: PopularMoviesErrorResolver());
  }
}
