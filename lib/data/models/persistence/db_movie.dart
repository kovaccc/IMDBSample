import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/common/base/persistable.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import '../../../config/constants.dart';
import 'db_genre.dart';

part 'db_movie.g.dart';

@HiveType(typeId: Constants.movieTypeAdapterId)
class DBMovie extends HiveObject implements Persistable<Movie> {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String? backdropPath;
  @HiveField(2)
  HiveList genres;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String originalLanguage;
  @HiveField(5)
  final String originalTitle;
  @HiveField(6)
  final String? overview;
  @HiveField(7)
  final double? popularity;
  @HiveField(8)
  final String? posterPath;
  @HiveField(9)
  final String releaseDate;
  @HiveField(10)
  final String title;
  @HiveField(11)
  final bool? video;
  @HiveField(12)
  final double? voteAverage;
  @HiveField(13)
  final int? voteCount;
  @HiveField(14)
  bool isFavourite;
  @HiveField(15)
  final int? page;

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
    required this.page,
  });

  @override
  Movie asDomain() {
    return Movie(
        backdropPath: backdropPath,
        genres: genres.cast<DBGenre>().asDomain(),
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
        voteAverage: voteAverage,
        isFavourite: isFavourite);
  }
}
