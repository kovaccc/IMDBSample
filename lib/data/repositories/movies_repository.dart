import 'package:imdb_sample/data/local/sources/movies_local_data_source.dart';
import 'package:imdb_sample/data/local/sources/movies_pages_local_data_source.dart';
import 'package:imdb_sample/data/remote/sources/movies_remote_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class IMoviesRepository {
  Future<void> fetchSimplePopularMovies();
}

@Singleton(as: IMoviesRepository)
class MoviesRepository implements IMoviesRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  final MoviesLocalDataSource _moviesLocalDataSource;
  final MoviesPagesLocalDataSource _moviesPagesLocalDataSource;

  MoviesRepository(this._moviesRemoteDataSource, this._moviesLocalDataSource,
      this._moviesPagesLocalDataSource);

  @override
  Future<void> fetchSimplePopularMovies() async {
    final popularMoviesResponse =
        await _moviesRemoteDataSource.getSimplePopularMovies();

  }
}
