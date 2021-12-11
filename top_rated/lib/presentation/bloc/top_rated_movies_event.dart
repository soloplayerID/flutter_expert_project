part of 'top_rated_movies_bloc.dart';

@immutable
abstract class TopRatedMovieEvent {
  const TopRatedMovieEvent();
}

class OnLoadData extends TopRatedMovieEvent {}
