part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object> get props => [];
}

class PopularMovieListInitial extends PopularMovieState {}

class PopularMovieListEmpty extends PopularMovieState {}

class PopularMovieListLoading extends PopularMovieState {}

class PopularMovieListError extends PopularMovieState {
  final String message;

  PopularMovieListError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularMovieListHasData extends PopularMovieState {
  final List<Movie> movies;

  PopularMovieListHasData(this.movies);

  @override
  List<Object> get props => [movies];
}
