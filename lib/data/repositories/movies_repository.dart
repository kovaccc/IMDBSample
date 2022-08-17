import 'package:imdb_sample/data/local/sources/genres_local_data_source.dart';
import 'package:imdb_sample/data/local/sources/movies_local_data_source.dart';
import 'package:imdb_sample/data/local/sources/movies_pages_local_data_source.dart';
import 'package:imdb_sample/data/remote/sources/genres_remote_data_source.dart';
import 'package:imdb_sample/data/remote/sources/movies_remote_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class IMoviesRepository {
  Future<void> fetchSimplePopularMoviesPage(int page);
}

@Singleton(as: IMoviesRepository)
class MoviesRepository implements IMoviesRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  final GenresLocalDataSource _genresLocalDataSource;
  final GenresRemoteDataSource _genresRemoteDataSource;
  final MoviesLocalDataSource _moviesLocalDataSource;
  final MoviesPagesLocalDataSource _moviesPagesLocalDataSource;

  MoviesRepository(this._moviesRemoteDataSource, this._genresLocalDataSource, this._genresRemoteDataSource,
      this._moviesLocalDataSource, this._moviesPagesLocalDataSource);

  @override
  Future<void> fetchSimplePopularMoviesPage(int page) async {
    final genresResponse = await _genresRemoteDataSource.getGenres();
    await _genresLocalDataSource.saveGenres(genresResponse.genres);
    final popularMoviesResponse = await _moviesRemoteDataSource.getSimplePopularMovies(page);
    await _moviesLocalDataSource.saveMovies(popularMoviesResponse.results);
  }
}
