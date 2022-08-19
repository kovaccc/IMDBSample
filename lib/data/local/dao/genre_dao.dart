import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/models/persistence/db_genre.dart';
import 'package:injectable/injectable.dart';
import '../../../config/constants.dart';

@singleton
class GenreDao {
  final Box<DBGenre> genreBox;

  GenreDao(@Named(Constants.boxGenre) this.genreBox);

  Future<void> insertGenre(DBGenre genre) async {
    await genreBox.put(genre.id, genre);
  }

  Future<void> updateGenre(DBGenre genre) async {
    await genre.save();
  }

  List<DBGenre> getGenres() {
    return genreBox.values.toList();
  }

  DBGenre? getGenre(int id) {
    return genreBox.get(id);
  }
}
