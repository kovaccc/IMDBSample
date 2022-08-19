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
      : super(const PopularMoviesInitial(<Movie>[], 0, false)) {
    on<PopularMoviesFetchStarted>(_onPopularMoviesFetchStarted);
  }

  void _onPopularMoviesFetchStarted(
      PopularMoviesFetchStarted event, Emitter<PopularMoviesState> emit) async {
    final nextPageKey = event.pageKey + 1;
    try {
      final popularMovies =
          await moviesRepository.fetchSimplePopularMoviesPage(nextPageKey);
      // try to get PageNumberError to know if above is last page since
      // total_pages and total_results from fetched data is not correct
      await moviesRepository.getRemoteMoviesByPage(nextPageKey + 1);
      emit(PopularMoviesLoaded(popularMovies, nextPageKey, false));
    } catch (error) {
      bool isLastPage = false;
      if (error is Exception) {
        if (error is PageNumberError) {
          isLastPage = true;
        }
        final persistMovies =
            moviesRepository.getPersistPopularMoviesByPage(nextPageKey);
        emit(PopularMoviesError(persistMovies, nextPageKey, isLastPage, error));
      }
    }
  }
}
