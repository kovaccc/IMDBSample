part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesState extends Equatable {
  final int currentPage;

  const PopularMoviesState(this.currentPage);
}

class PopularMoviesInitial extends PopularMoviesState {

  const PopularMoviesInitial(int currentPage) : super(currentPage);

  @override
  List<Object> get props => [currentPage];
}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;
  final bool isLastPage;
  final int pageKey;

  const PopularMoviesLoaded(this.movies, int currentPage, this.isLastPage, this.pageKey): super(currentPage);

  @override
  List<Object> get props => [movies, currentPage, isLastPage, pageKey];
}

class PopularMoviesError extends PopularMoviesState {
  final Exception error;

  const PopularMoviesError(int currentPage, this.error): super(currentPage);

  @override
  List<Object> get props => [error];
}
