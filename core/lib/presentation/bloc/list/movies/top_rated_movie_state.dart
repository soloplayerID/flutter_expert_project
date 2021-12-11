part of 'top_rated_movie_bloc.dart';

@immutable
abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();

  @override
  List<Object> get props => [];
}

class TopRatedMovieListInitial extends TopRatedMovieState {}

class TopRatedMovieListEmpty extends TopRatedMovieState {}

class TopRatedMovieListLoading extends TopRatedMovieState {}

class TopRatedMovieListError extends TopRatedMovieState {
  final String message;

  TopRatedMovieListError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedMovieListHasData extends TopRatedMovieState {
  final List<Movie> movies;

  TopRatedMovieListHasData(this.movies);

  @override
  List<Object> get props => [movies];
}
