import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/models/persistence/db_movie.dart';
import 'package:injectable/injectable.dart';

import '../../../config/constants.dart';

@singleton
class MovieDao {
  final Box<DBMovie> movieBox;

  MovieDao(@Named(Constants.boxMovie) this.movieBox);

  Future<void> insertMovie(DBMovie movie) async {
    await movieBox.put(movie.id, movie);
  }

  Future<void> updateMovie(DBMovie movie) async {
    await movie.save();
  }

  List<DBMovie> getMovies() {
    return movieBox.values.toList();
  }

  DBMovie? getMovie(int id) {
    return movieBox.get(id);
  }
}
