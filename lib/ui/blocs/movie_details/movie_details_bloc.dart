import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';

import '../../../data/models/persistence/db_movie.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MoviesRepository moviesRepository;

  MovieDetailsBloc({required this.moviesRepository})
      : super(const MovieDetailsInitial()) {
    on<MovieDetailsFavouriteUpdated>(_onMovieDetailsFavouriteUpdated);
    on<MovieDetailsShowingStarted>(_onMovieDetailsShowingStarted);
  }

  ValueListenable<Box<DBMovie>> getMovieListenable(int id) {
    return moviesRepository.getMovieListenable(id);
  }

  void _onMovieDetailsFavouriteUpdated(MovieDetailsFavouriteUpdated event,
      Emitter<MovieDetailsState> emit) async {
    final updatedMovie = await moviesRepository.toggleFavourite(event.movie);
    if (updatedMovie != null) {
      emit(MovieDetailsLoaded(updatedMovie, false));
    } else {
      emit(MovieDetailsLoaded(event.movie, true));
    }
  }

  void _onMovieDetailsShowingStarted(
      MovieDetailsShowingStarted event, Emitter<MovieDetailsState> emit) {
    emit(MovieDetailsLoaded(event.movie, false));
  }
}
