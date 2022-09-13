import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/domain/movie.dart';

part 'movie_details_state.freezed.dart';

@freezed
abstract class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;

  const factory MovieDetailsState.updateError() =
      _UpdateError;

  const factory MovieDetailsState.updateSuccess({required Movie movie}) =
      _UpdateSuccess;
}
