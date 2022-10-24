import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/providers/movie_details/movie_details_state.dart';
import '../../../data/repositories/movies_repository.dart';

class MovieDetailsNotifier extends StateNotifier<MovieDetailsState> {
  final MoviesRepository moviesRepository;

  MovieDetailsNotifier({required this.moviesRepository})
      : super(const MovieDetailsState.initial());

  void updateMovieDetailsFavourite(int movieId) async {
    final updatedMovie = await moviesRepository.toggleFavourite(movieId);
    if (updatedMovie != null) {
      state = MovieDetailsState.updateSuccess(movie: updatedMovie);
    } else {
      state = const MovieDetailsState.updateError();
    }
  }
}
