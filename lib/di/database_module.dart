import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../config/constants.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @singleton
  Future<Box> get genreBox => Hive.openBox(Constants.boxGenre);
}
