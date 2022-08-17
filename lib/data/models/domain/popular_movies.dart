import 'package:imdb_sample/common/base/domain_data.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import '../persistence/db_popular_movies.dart';

class PopularMovies implements DomainData<DBPopularMovies> {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  PopularMovies(
      {required this.page,
      required this.movies,
      required this.totalPages,
      required this.totalResults});

  @override
  DBPopularMovies asDatabase() {
    return DBPopularMovies(
        page: page,
        movies: movies,
        totalPages: totalPages,
        totalResults: totalResults);
  }
}
