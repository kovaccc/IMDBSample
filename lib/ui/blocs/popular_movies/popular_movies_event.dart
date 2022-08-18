part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class PopularMoviesFetchStarted extends PopularMoviesEvent {
  final int currentPageKey;

  const PopularMoviesFetchStarted(this.currentPageKey);

  @override
  List<Object> get props => [currentPageKey];
}
