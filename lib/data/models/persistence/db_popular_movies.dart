import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/common/base/persistable.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';

import '../../../config/constants.dart';
import '../domain/popular_movies.dart';

part 'db_popular_movies.g.dart';

@HiveType(typeId: Constants.popularMoviesTypeAdapterId)
class DBPopularMovies implements Persistable<PopularMovies> {
  @HiveField(0)
  final int page;
  @HiveField(1)
  final List<Movie> movies;
  @HiveField(2)
  final int totalPages;
  @HiveField(3)
  final int totalResults;

  DBPopularMovies({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  PopularMovies asDomain() {
    return PopularMovies(
        page: page,
        movies: movies,
        totalPages: totalPages,
        totalResults: totalResults);
  }
}
