part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesState extends Equatable {
  final List<Movie> movies;
  final int currentPage;
  final bool isLastPage;

  const PopularMoviesState(this.movies, this.currentPage, this.isLastPage);

  @override
  List<Object> get props => [movies, currentPage, isLastPage];
}

class PopularMoviesInitial extends PopularMoviesState {
  const PopularMoviesInitial(
      List<Movie> movies, int currentPage, bool isLastPage)
      : super(movies, currentPage, isLastPage);

  @override
  List<Object> get props => [movies, currentPage, isLastPage];
}

class PopularMoviesLoaded extends PopularMoviesState {
  const PopularMoviesLoaded(
      List<Movie> movies, int currentPage, bool isLastPage)
      : super(movies, currentPage, isLastPage);

  @override
  List<Object> get props => [movies, currentPage, isLastPage];
}

class PopularMoviesError extends PopularMoviesState {
  final Exception error;

  const PopularMoviesError(
      List<Movie> movies, int currentPage, bool isLastPage, this.error)
      : super(movies, currentPage, isLastPage);

  @override
  List<Object> get props => [movies, currentPage, isLastPage, error];
}
