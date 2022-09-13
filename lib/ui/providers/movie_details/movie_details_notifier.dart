import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/providers/movie_details/movie_details_state.dart';
import '../../../data/repositories/movies_repository.dart';

class MovieDetailsNotifier extends StateNotifier<MovieDetailsState> {
  final MoviesRepository moviesRepository;
  final int id;

  MovieDetailsNotifier({required this.moviesRepository, required this.id})
      : super(const MovieDetailsState.initial());

  void updateMovieDetailsFavourite() async {
    final updatedMovie = await moviesRepository.toggleFavourite(id);
    if (updatedMovie != null) {
      state = MovieDetailsState.updateSuccess(movie: updatedMovie);
    } else {
      state = const MovieDetailsState.updateError();
    }
  }
}
