import 'package:hive/hive.dart';
import 'package:imdb_sample/data/local/dao/popular_movies_page_dao.dart';
import 'package:imdb_sample/data/models/persistence/db_popular_movies_page.dart';
import 'package:imdb_sample/data/models/responses/popular_movies_response.dart';
import 'package:injectable/injectable.dart';

import '../dao/movie_dao.dart';

@singleton
class MoviesPagesLocalDataSource {
  final PopularMoviesPageDao _moviesPageDao;
  final MovieDao _movieDao;

  MoviesPagesLocalDataSource(this._moviesPageDao, this._movieDao);

  Future<void> saveMoviePage(
      PopularMoviesResponse popularMoviesResponse) async {
    var dbPopularMoviePage = _moviesPageDao.getPopularMoviesPage(
        popularMoviesResponse.page);
    if (dbPopularMoviePage == null) {
      dbPopularMoviePage = DBPopularMoviesPage(page: popularMoviesResponse.page,
          movies: HiveList(_movieDao.movieBox),
          totalPages: popularMoviesResponse.totalPages,
          totalResults: popularMoviesResponse.totalResults);
      await _moviesPageDao.insertPopularMoviesPage(dbPopularMoviePage);
    } else {
      dbMovie.adult = movie.adult;
      dbMovie.backdropPath = movie.backdropPath;
      dbMovie.genres = HiveList(_genreDao.genreBox);
      dbMovie.genres.addAll(_genreDao
          .getGenres()
          .where((element) => movie.genreIds.contains(element.id)));
      dbMovie.originalLanguage = movie.originalLanguage;
      dbMovie.originalTitle = movie.originalTitle;
      dbMovie.overview = movie.overview;
      dbMovie.popularity = movie.popularity;
      dbMovie.posterPath = movie.posterPath;
      dbMovie.releaseDate = movie.releaseDate;
      dbMovie.title = movie.title;
      dbMovie.video = movie.video;
      dbMovie.voteAverage = movie.voteAverage;
      dbMovie.voteCount = movie.voteCount;
      await _movieDao.updateMovie(dbMovie)
      await _moviesPageDao.insertPopularMoviesPage(popularMoviesPage);
    }

    DBPopularMoviesPage? getMoviePage(int page) {
      return _moviesPageDao.getPopularMoviesPage(page);
    }
  }
