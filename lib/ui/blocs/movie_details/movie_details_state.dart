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

class MovieDetailsLoaded extends MovieDetailsState {
  final Movie movie;
  final bool updateError;

  const MovieDetailsLoaded(this.movie, this.updateError);

  @override
  List<Object> get props => [movie];
}
