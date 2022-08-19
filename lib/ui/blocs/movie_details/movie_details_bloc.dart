import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MoviesRepository moviesRepository;

  MovieDetailsBloc({required this.moviesRepository})
      : super(MovieDetailsInitial()) {
    on<MovieDetailsFavouriteUpdated>(_onMovieDetailsUpdated);
  }

  void _onMovieDetailsUpdated(
      MovieDetailsFavouriteUpdated event, Emitter<MovieDetailsState> emit) async {
    final updatedMovie = await moviesRepository.toggleFavourite(event.movie);
    if (updatedMovie != null) {
      emit(MovieDetailsLoaded(updatedMovie));
    } else {
      emit(const MovieDetailsUpdateError());
    }
  }
}
