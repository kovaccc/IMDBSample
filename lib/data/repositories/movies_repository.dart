import 'package:imdb_sample/data/local/sources/movies_local_data_source.dart';
import 'package:imdb_sample/data/remote/sources/movies_remote_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class IMoviesRepository {
  Future<void> fetchSimplePopularMoviesPage(int page);
}

@Singleton(as: IMoviesRepository)
class MoviesRepository implements IMoviesRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  final MoviesLocalDataSource _moviesLocalDataSource;

  MoviesRepository(this._moviesRemoteDataSource, this._moviesLocalDataSource);

  @override
  Future<void> fetchSimplePopularMoviesPage(int page) async {
    final popularMoviesResponse =
        await _moviesRemoteDataSource.getSimplePopularMovies(page);
    await _moviesLocalDataSource.saveMovies(popularMoviesResponse);
  }
}
