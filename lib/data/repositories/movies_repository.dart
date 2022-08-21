import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/local/sources/movies_local_data_source.dart';
import 'package:imdb_sample/data/models/responses/popular_movies_response.dart';
import 'package:imdb_sample/data/remote/sources/movies_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../models/domain/movie.dart';
import '../models/persistence/db_movie.dart';

abstract class IMoviesRepository {
  Future<List<Movie>> fetchPopularMoviesPage(int page);

  List<Movie> getPersistPopularMoviesByPage(int page);

  Future<PopularMoviesResponse> getRemoteMoviesByPage(int page);

  Future<Movie?> toggleFavourite(Movie movie);

  ValueListenable<Box<DBMovie>> getMovieListenable(int id);

  ValueListenable<Box<DBMovie>> getPopularMoviesListenable();
}

@Singleton(as: IMoviesRepository)
class MoviesRepository implements IMoviesRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  final MoviesLocalDataSource _moviesLocalDataSource;

  MoviesRepository(this._moviesRemoteDataSource, this._moviesLocalDataSource);

  @override
  Future<List<Movie>> fetchPopularMoviesPage(int page) async {
    final popularMoviesResponse =
        await _moviesRemoteDataSource.getPopularMovies(page);
    await _moviesLocalDataSource.saveMovies(popularMoviesResponse);
    return _moviesLocalDataSource.getMoviesForPage(page);
  }

  @override
  List<Movie> getPersistPopularMoviesByPage(int page) {
    return _moviesLocalDataSource.getMoviesForPage(page);
  }

  @override
  Future<PopularMoviesResponse> getRemoteMoviesByPage(int page) async {
    return await _moviesRemoteDataSource.getPopularMovies(page);
  }

  @override
  Future<Movie?> toggleFavourite(Movie movie) async {
    return await _moviesLocalDataSource.toggleFavourite(movie);
  }

  @override
  ValueListenable<Box<DBMovie>> getMovieListenable(int id) {
    return _moviesLocalDataSource.getMovieListenable(id);
  }

  @override
  ValueListenable<Box<DBMovie>> getPopularMoviesListenable() {
    return _moviesLocalDataSource.getPopularMoviesListenable();
  }
}
