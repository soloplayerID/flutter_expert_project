import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:toprated/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc
    extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _topRatedMovies;

  TopRatedMovieBloc(this._topRatedMovies) : super(TopRatedMovieListEmpty());

  @override
  Stream<TopRatedMovieState> mapEventToState(
    TopRatedMovieEvent event,
  ) async* {
    if (event is OnLoadDataTopRated) {
      yield TopRatedMovieListLoading();

      final topRated = await _topRatedMovies.execute();

      yield* topRated.fold(
        (failure) async* {
          yield TopRatedMovieListError(failure.message);
        },
        (topRatedMovies) async* {
          yield TopRatedMovieListHasData(topRatedMovies);
        },
      );
    }
  }
}
