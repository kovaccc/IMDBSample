part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial();

  @override
  List<Object> get props => [];
}

class MovieDetailsUpdateSuccess extends MovieDetailsState {
  final Movie movie;

  const MovieDetailsUpdateSuccess(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieDetailsUpdateError extends MovieDetailsState {
  final Movie movie;

  const MovieDetailsUpdateError(this.movie);

  @override
  List<Object> get props => [movie];
}
