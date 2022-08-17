import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/models/persistence/db_popular_movies_page.dart';
import 'package:injectable/injectable.dart';

import '../../../config/constants.dart';

@singleton
class PopularMoviesPageDao {
  final Box<DBPopularMoviesPage> _popularMoviesPageBox;

  PopularMoviesPageDao(
      @Named(Constants.boxPopularMoviesPage) this._popularMoviesPageBox);

  Future<void> insertPopularMoviesPage(
      DBPopularMoviesPage popularMoviesPage) async {
    await _popularMoviesPageBox.put(popularMoviesPage.page, popularMoviesPage);
  }

  Future<void> updatePopularMoviePage(
      DBPopularMoviesPage popularMoviesPage) async {
    await popularMoviesPage.save();
  }

  DBPopularMoviesPage? getPopularMoviesPage(int page) {
    return _popularMoviesPageBox.get(page);
  }
}
