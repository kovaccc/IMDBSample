import 'genre.dart';

class Movie {
  final String? backdropPath;
  final List<Genre> genres;
  final int id;
  final String? overview;
  final String? posterPath;
  final String title;
  final double? voteAverage;
  final bool isFavourite;
  final int localId;

  Movie({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.isFavourite,
    required this.localId,
  });
}
