import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_response.dart';

part 'popular_movies_response.freezed.dart';

part 'popular_movies_response.g.dart';

@freezed
class PopularMoviesResponse with _$PopularMoviesResponse {
  factory PopularMoviesResponse({
    required int page,
    required List<MovieResponse> results,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'total_pages') required int totalPages,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _PopularMoviesResponse;

  factory PopularMoviesResponse.fromJson(Map<String, Object?> json) =>
      _$PopularMoviesResponseFromJson(json);
}
