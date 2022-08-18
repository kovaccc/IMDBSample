import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/util/error_handler.dart';

part 'popular_movies_event.dart';

part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final MoviesRepository moviesRepository;

  PopularMoviesBloc({required this.moviesRepository})
      : super(const PopularMoviesInitial(0)) {
    on<PopularMoviesFetchStarted>(_onPopularMoviesFetchStarted);
  }

  void _onPopularMoviesFetchStarted(
      PopularMoviesFetchStarted event, Emitter<PopularMoviesState> emit) async {
    try {
      final popularMovies =
          await moviesRepository.fetchSimplePopularMoviesPage(state.currentPage + 1);
      emit(PopularMoviesLoaded(popularMovies, state.currentPage + 1, false, event.currentPageKey + popularMovies.length));
    } catch (error, stacktrace) {
      if (error is Exception) {
        print(stacktrace.toString());
        bool isLastPage = false;
        if (error is PageNumberError) {
          isLastPage = true;
        }
      }
      final persistMovies = moviesRepository.getPersistPopularMoviesPage(state.currentPage + 1);
      emit(PopularMoviesLoaded(persistMovies, state.currentPage + 1, false, event.currentPageKey + persistMovies.length));
    }
  }
}
