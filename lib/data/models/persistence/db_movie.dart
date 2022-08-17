import 'package:hive_flutter/hive_flutter.dart';
import '../../../config/constants.dart';

part 'db_movie.g.dart';

@HiveType(typeId: Constants.movieTypeAdapterId)
class DBMovie extends HiveObject {
  @HiveField(0)
  bool adult;
  @HiveField(1)
  String backdropPath;
  @HiveField(2)
  HiveList genres;
  @HiveField(3)
  final int id;
  @HiveField(4)
  String originalLanguage;
  @HiveField(5)
  String originalTitle;
  @HiveField(6)
  String overview;
  @HiveField(7)
  double popularity;
  @HiveField(8)
  String posterPath;
  @HiveField(9)
  String releaseDate;
  @HiveField(10)
  String title;
  @HiveField(11)
  bool video;
  @HiveField(12)
  double voteAverage;
  @HiveField(13)
  int voteCount;
  @HiveField(14)
  bool isFavourite;

  DBMovie({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.isFavourite,
  });
}
