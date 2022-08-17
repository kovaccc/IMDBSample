import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../config/constants.dart';

part 'genre.g.dart';

@HiveType(typeId: Constants.genreTypeAdapterId)
@JsonSerializable()
class Genre extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

// person.save();