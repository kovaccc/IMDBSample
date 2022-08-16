import 'package:imdb_sample/data/remote/sources/movies_remote_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class IMoviesRepository {
  Future<void> getSimplePopularMovies();
}

@Singleton(as: IMoviesRepository)
class MoviesRepository implements IMoviesRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;

  MoviesRepository(this._moviesRemoteDataSource);

  @override
  Future<void> getSimplePopularMovies() async {
    final popularMoviesResponse =
        await _moviesRemoteDataSource.getSimplePopularMovies();
  }
}
