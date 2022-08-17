import 'package:imdb_sample/common/base/domain_data.dart';
import 'package:imdb_sample/data/models/persistence/db_genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre implements DomainData<DBGenre> {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  @override
  DBGenre asDatabase() {
    return DBGenre(id: id, name: name);
  }
}
