part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class PopularMoviesFetchStarted extends PopularMoviesEvent {
  final int pageKey;

  const PopularMoviesFetchStarted(this.pageKey);

  @override
  List<Object> get props => [pageKey];
}
