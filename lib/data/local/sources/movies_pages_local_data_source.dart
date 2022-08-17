import 'package:hive/hive.dart';
import 'package:imdb_sample/data/local/dao/popular_movies_page_dao.dart';
import 'package:imdb_sample/data/models/persistence/db_popular_movies_page.dart';
import 'package:imdb_sample/data/models/responses/movie_response.dart';
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
    var dbPopularMoviesPage =
    _moviesPageDao.getPopularMoviesPage(popularMoviesResponse.page);
    if (dbPopularMoviesPage == null) {
      dbPopularMoviesPage = DBPopularMoviesPage(
          page: popularMoviesResponse.page,
          movies: HiveList(_movieDao.movieBox),
          totalPages: popularMoviesResponse.totalPages,
          totalResults: popularMoviesResponse.totalResults);
      _addMovies(dbPopularMoviesPage, popularMoviesResponse.results);
      await _moviesPageDao.insertPopularMoviesPage(dbPopularMoviesPage);
    } else {
      dbPopularMoviesPage.movies = HiveList(_movieDao.movieBox);
      dbPopularMoviesPage.totalPages = popularMoviesResponse.totalPages;
      dbPopularMoviesPage.totalResults = popularMoviesResponse.totalResults;
      _addMovies(dbPopularMoviesPage, popularMoviesResponse.results);
      await _moviesPageDao.updatePopularMoviePage(dbPopularMoviesPage);
    }
  }

  void _addMovies(DBPopularMoviesPage dbPopularMoviesPage,
      List<MovieResponse> movies) {
    final dbMoviesIds = _movieDao.getMovies().map((e) => e.id).toList();
    for (var movie in movies) {
      if (dbMoviesIds.contains(movie.id)) {
        final dbMovieToAdd = _movieDao.getMovie(movie.id);
        if (dbMovieToAdd != null) {
          dbPopularMoviesPage.movies.add(dbMovieToAdd);
        }
      }
    }
  }

  DBPopularMoviesPage? getMoviePage(int page) {
    return _moviesPageDao.getPopularMoviesPage(page);
  }
}
