import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:toprated/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _topRatedMovies;

  TopRatedMoviesBloc(this._topRatedMovies) : super(TopRatedMovieEmpty());

  @override
  Stream<TopRatedMovieState> mapEventToState(
    TopRatedMovieEvent event,
  ) async* {
    if (event is OnLoadData) {
      yield TopRatedMovieLoading();
      final result = await _topRatedMovies.execute();

      yield* result.fold(
        (failure) async* {
          yield TopRatedMovieError(failure.message);
        },
        (data) async* {
          yield TopRatedMovieHasData(data);
        },
      );
    }
  }
}
