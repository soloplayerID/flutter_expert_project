part of 'now_playing_movie_bloc.dart';

@immutable
abstract class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object> get props => [];
}

class NowPlayingMovieListInitial extends NowPlayingMovieState {}

class NowPlayingMovieListEmpty extends NowPlayingMovieState {}

class NowPlayingMovieListLoading extends NowPlayingMovieState {}

class NowPlayingMovieListError extends NowPlayingMovieState {
  final String message;

  NowPlayingMovieListError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingMovieListHasData extends NowPlayingMovieState {
  final List<Movie> movies;

  NowPlayingMovieListHasData(this.movies);

  @override
  List<Object> get props => [movies];
}
