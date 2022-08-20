import 'package:imdb_sample/data/local/dao/auth_dao.dart';
import 'package:imdb_sample/data/models/responses/genres_response.dart';
import 'package:imdb_sample/data/remote/api_client.dart';
import 'package:injectable/injectable.dart';

import '../../../common/base/base_remote_data_source.dart';

@singleton
class GenresRemoteDataSource extends BaseRemoteDataSource {
  final ApiClient _apiClient;

  GenresRemoteDataSource(this._apiClient, AuthDao authDao) : super(authDao);

  Future<GenresResponse> getGenres() async {
    return await apiRequest(apiCall: _apiClient.getGenres());
  }
}
