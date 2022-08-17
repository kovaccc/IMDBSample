import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/constants.dart';

part 'db_popular_movies_page.g.dart';

@HiveType(typeId: Constants.popularMoviesTypeAdapterId)
class DBPopularMoviesPage extends HiveObject {
  @HiveField(0)
  int page;
  @HiveField(1)
  HiveList movies;
  @HiveField(2)
  int totalPages;
  @HiveField(3)
  int totalResults;

  DBPopularMoviesPage({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
}
