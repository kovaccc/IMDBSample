import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response.freezed.dart';

part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  factory MovieResponse({
    required bool adult,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'original_language') required String originalLanguage,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'poster_path') required String posterPath,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'release_date') required String releaseDate,
    required String title,
    required bool video,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'vote_average') required double voteAverage,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, Object?> json) =>
      _$MovieResponseFromJson(json);
}
