import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:popular/domain/usecases/get_popular_movies.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc
    extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies _popularMovies;

  PopularMovieBloc(this._popularMovies) : super(PopularMovieListEmpty());

  @override
  Stream<PopularMovieState> mapEventToState(
    PopularMovieEvent event,
  ) async* {
    if (event is OnLoadDataPopular) {
      yield PopularMovieListLoading();

      final popular = await _popularMovies.execute();

      yield* popular.fold(
        (failure) async* {
          yield PopularMovieListError(failure.message);
        },
        (popularMovies) async* {
          yield PopularMovieListHasData(popularMovies);
        },
      );
    }
  }
}
