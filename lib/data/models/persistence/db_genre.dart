import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/common/base/persistable.dart';
import 'package:imdb_sample/data/models/domain/genre.dart';

import '../../../config/constants.dart';

part 'db_genre.g.dart';

@HiveType(typeId: Constants.genreTypeAdapterId)
class DBGenre extends HiveObject implements Persistable<Genre> {
  @HiveField(0)
  final int id;

  @HiveField(1)
  String name;

  DBGenre({
    required this.id,
    required this.name,
  });

  @override
  Genre asDomain() {
    return Genre(id: id, name: name);
  }
}
