part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieEvent extends Equatable {
  const PopularMovieEvent();

  @override
  List<Object> get props => [];
}

class OnLoadDataPopular extends PopularMovieEvent {}
