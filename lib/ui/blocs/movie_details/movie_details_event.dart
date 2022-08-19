part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class MovieDetailsFavouriteUpdated extends MovieDetailsEvent {
  final Movie movie;

  const MovieDetailsFavouriteUpdated(this.movie);

  @override
  List<Object?> get props => [movie];
}
