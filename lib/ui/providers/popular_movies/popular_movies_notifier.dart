import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/ui/providers/popular_movies/popular_movies_state.dart';
import 'package:imdb_sample/util/error_handler.dart';

class PopularMoviesNotifier extends StateNotifier<PopularMoviesState> {
  final MoviesRepository moviesRepository;

  PopularMoviesNotifier({required this.moviesRepository})
      : super(const PopularMoviesState.initial(
            movies: <Movie>[], currentPage: 0, isLastPage: false));

  Future<void> fetchNextPopularMovies(int pageKey) async {
    final nextPageKey = pageKey + 1;
    try {
      final popularMovies =
          await moviesRepository.fetchPopularMoviesPage(nextPageKey);
      // try to get PageNumberError to know if above is last page since
      // total_pages and total_results from fetched data is not correct
      await moviesRepository.getRemoteMoviesByPage(nextPageKey + 1);
      state = PopularMoviesState.loaded(
          movies: popularMovies, currentPage: nextPageKey, isLastPage: false);
    } catch (error) {
      bool isLastPage = false;
      if (error is Exception) {
        if (error is PageNumberError) {
          isLastPage = true;
        }
        final persistMovies =
            moviesRepository.getPersistPopularMoviesByPage(nextPageKey);
        state = PopularMoviesState.error(
            movies: persistMovies,
            currentPage: nextPageKey,
            isLastPage: isLastPage,
            error: error);
      }
    }
  }

  Future<void> fetchFirstPage() async {
    try {
      final popularMovies = await moviesRepository.fetchPopularMoviesPage(1);
      state = PopularMoviesState.loaded(
          movies: popularMovies, currentPage: 1, isLastPage: false);
    } catch (error) {
      if (error is Exception) {
        final persistMovies = moviesRepository.getPersistPopularMoviesByPage(1);
        state = PopularMoviesState.error(
            movies: persistMovies,
            currentPage: 2,
            isLastPage: false,
            error: error);
      }
    }
  }
}
