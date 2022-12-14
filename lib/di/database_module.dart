import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../config/constants.dart';
import '../data/models/persistence/db_genre.dart';
import '../data/models/persistence/db_movie.dart';

@module
abstract class DatabaseModule {
  @Named(Constants.boxGenre)
  @preResolve
  @singleton
  Future<Box<DBGenre>> get genreBox {
    Hive.registerAdapter(DBGenreAdapter());
    return Hive.openBox<DBGenre>(Constants.boxGenre);
  }

  @Named(Constants.boxMovie)
  @preResolve
  @singleton
  Future<Box<DBMovie>> get movieBox {
    Hive.registerAdapter(DBMovieAdapter());
    return Hive.openBox<DBMovie>(Constants.boxMovie);
  }

  @Named(Constants.boxAuth)
  @preResolve
  @singleton
  Future<Box> get authBox => Hive.openBox(Constants.boxAuth);
}
