import 'package:imdb_sample/data/models/domain/movie.dart';

class PopularMovies {
  final int page;
  final List<Movie> movies;
  final int totalPages;

  PopularMovies({
    required this.page,
    required this.movies,
    required this.totalPages,
  });
}
