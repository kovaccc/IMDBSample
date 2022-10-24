import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/domain/movie.dart';
part 'popular_movies_state.freezed.dart';
@freezed
abstract class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.initial({required List<Movie> movies,required int currentPage,required bool isLastPage}) = _Initial;

  const factory PopularMoviesState.loaded({required List<Movie> movies,required int currentPage,required bool isLastPage}) =
  _Loaded;

  const factory PopularMoviesState.error({required List<Movie> movies,required int currentPage,required bool isLastPage, required Exception error}) =
  _Error;
}

