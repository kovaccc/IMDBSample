import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_sample/data/models/domain/genre.dart';

part 'genres_response.freezed.dart';

part 'genres_response.g.dart';

@freezed
class GenresResponse with _$GenresResponse {
  factory GenresResponse({required List<Genre> genres}) = _GenresResponse;

  factory GenresResponse.fromJson(Map<String, Object?> json) =>
      _$GenresResponseFromJson(json);
}
