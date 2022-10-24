import 'package:flutter/foundation.dart';
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

  Future<void> deleteMoviesByPage(int page) async {
    await Future.forEach<DBMovie>(getMoviesByPage(page), (movie) async {
      await movie.delete();
    });
  }

  Future<void> updateMovie(DBMovie movie) async {
    await movie.save();
  }

  List<DBMovie> getMoviesByPage(int page) {
    return movieBox.values
        .toList()
        .where((movie) => movie.page == page)
        .toList();
  }

  List<DBMovie> getAllMovies() {
    return movieBox.values.toList();
  }

  DBMovie? getMovie(int id) {
    return movieBox.get(id);
  }

  ValueListenable<Box<DBMovie>> getMovieListenable(int id) {
    return movieBox.listenable(keys: [id]);
  }

  ValueListenable<Box<DBMovie>> getMoviesListenable() {
    return movieBox.listenable();
  }
}
