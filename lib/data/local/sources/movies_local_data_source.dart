import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/common/base/persistable.dart';
import 'package:imdb_sample/data/local/dao/genre_dao.dart';
import 'package:imdb_sample/data/local/dao/movie_dao.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/models/persistence/db_movie.dart';
import 'package:imdb_sample/data/models/responses/popular_movies_response.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

@singleton
class MoviesLocalDataSource {
  final MovieDao _movieDao;
  final GenreDao _genreDao;

  MoviesLocalDataSource(this._movieDao, this._genreDao);

  Future<void> saveMovies(PopularMoviesResponse popularMoviesResponse) async {
    final page = popularMoviesResponse.page;
    final dbMovies = getMoviesForPage(page ?? 0);
    await _movieDao.deleteMoviesByPage(page ?? 0);
    for (var movie in popularMoviesResponse.results) {
      final existingMovie =
          dbMovies.firstWhereOrNull((element) => element.id == movie.id);
      final dbMovie = DBMovie(
          adult: movie.adult ?? false,
          backdropPath: movie.backdropPath,
          genres: HiveList(_genreDao.genreBox),
          id: movie.id ?? -1,
          originalLanguage: movie.originalLanguage ?? "",
          originalTitle: movie.originalTitle ?? "",
          overview: movie.overview,
          popularity: movie.popularity,
          posterPath: movie.posterPath,
          releaseDate: movie.releaseDate ?? "",
          title: movie.title ?? "",
          video: movie.video,
          voteAverage: movie.voteAverage,
          voteCount: movie.voteCount,
          isFavourite: existingMovie?.isFavourite ?? false,
          page: page,
          localId: existingMovie != null
              ? existingMovie.localId
              : _movieDao.getAllMovies().length + 1);
      _addMovieGenres(dbMovie, movie.genreIds);
      await _movieDao.insertMovie(dbMovie);
    }
  }

  void _addMovieGenres(DBMovie dbMovie, List<int> genreIds) {
    dbMovie.genres.addAll(_genreDao
        .getGenres()
        .where((element) => genreIds.contains(element.id)));
  }

  Future<Movie?> toggleFavourite(int movieId) async {
    final dbMovie = _movieDao.getMovie(movieId);
    if (dbMovie != null) {
      dbMovie.isFavourite = !dbMovie.isFavourite;
      await _movieDao.updateMovie(dbMovie);
    }
    return dbMovie?.asDomain();
  }

  List<Movie> getMoviesForPage(int page) {
    return _movieDao.getMoviesByPage(page).asDomain();
  }

  ValueListenable<Box<DBMovie>> getMovieListenable(int id) {
    return _movieDao.getMovieListenable(id);
  }

  ValueListenable<Box<DBMovie>> getPopularMoviesListenable() {
    return _movieDao.getMoviesListenable();
  }
}
