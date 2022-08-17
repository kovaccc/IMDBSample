import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/local/dao/genre_dao.dart';
import 'package:imdb_sample/data/local/dao/movie_dao.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/models/persistence/db_genre.dart';
import 'package:imdb_sample/data/models/persistence/db_movie.dart';
import 'package:imdb_sample/data/models/responses/movie_response.dart';
import 'package:injectable/injectable.dart';

@singleton
class MoviesLocalDataSource {
  final MovieDao _movieDao;
  final GenreDao _genreDao;

  MoviesLocalDataSource(this._movieDao, this._genreDao);

  Future<void> saveMovies(List<MovieResponse> movies) async {
    for (var movie in movies) {
      var dbMovie = _movieDao.getMovie(movie.id);
      if (dbMovie == null) {
        dbMovie = DBMovie(
            adult: movie.adult,
            backdropPath: movie.backdropPath,
            genres: HiveList(_genreDao.genreBox),
            id: movie.id,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            popularity: movie.popularity,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            title: movie.title,
            video: movie.video,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            isFavourite: false);
        _addMovieGenres(dbMovie, movie.genreIds);
        await _movieDao.insertMovie(dbMovie);
      } else {
        dbMovie.adult = movie.adult;
        dbMovie.backdropPath = movie.backdropPath;
        dbMovie.genres = HiveList(_genreDao.genreBox);
        _addMovieGenres(dbMovie, movie.genreIds);
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
        await _movieDao.updateMovie(dbMovie);
      }
    }
  }

  void _addMovieGenres(DBMovie dbMovie, List<int> genreIds) {
    dbMovie.genres.addAll(_genreDao
        .getGenres()
        .where((element) => genreIds.contains(element.id)));
  }

  Future<void> toggleFavourite(Movie movie) async {
    final dbMovie = _movieDao.getMovie(movie.id);
    if (dbMovie != null) {
      dbMovie.isFavourite = !dbMovie.isFavourite;
      _movieDao.updateMovie(dbMovie);
    }
  }

  List<Movie> getMovies() {
    return _movieDao
        .getMovies()
        .map((movie) => Movie(
            backdropPath: movie.backdropPath,
            genres: movie.genres
                .map((genre) => (genre as DBGenre).asDomain())
                .toList(),
            id: movie.id,
            overview: movie.overview,
            posterPath: movie.posterPath,
            title: movie.title,
            voteAverage: movie.voteAverage))
        .toList();
  }
}
