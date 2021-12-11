import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'now_playing_movie_event.dart';
part 'now_playing_movie_state.dart';

class NowPlayingMovieBloc
    extends Bloc<NowPlayingMovieEvent, NowPlayingMovieState> {
  final GetNowPlayingMovies _nowPlayingMovies;

  NowPlayingMovieBloc(this._nowPlayingMovies)
      : super(NowPlayingMovieListEmpty());

  @override
  Stream<NowPlayingMovieState> mapEventToState(
    NowPlayingMovieEvent event,
  ) async* {
    if (event is OnLoadDataNowPlaying) {
      yield NowPlayingMovieListLoading();

      final nowPlaying = await _nowPlayingMovies.execute();

      yield* nowPlaying.fold(
        (failure) async* {
          yield NowPlayingMovieListError(failure.message);
        },
        (nowPlayingMovies) async* {
          yield NowPlayingMovieListHasData(nowPlayingMovies);
        },
      );
    }
  }
}
