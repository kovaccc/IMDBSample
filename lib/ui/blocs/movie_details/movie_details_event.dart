part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  final Movie movie;

  const MovieDetailsEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class MovieDetailsFavouriteUpdated extends MovieDetailsEvent {
  const MovieDetailsFavouriteUpdated(Movie movie) : super(movie);

  @override
  List<Object?> get props => [movie];
}