import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tvseries.dart';
import 'package:core/domain/usecases/tvseries/get_now_playing_tvseries.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'now_playing_tv_event.dart';
part 'now_playing_tv_state.dart';

class NowPlayingTvBloc
    extends Bloc<NowPlayingTvEvent, NowPlayingTvState> {
  final GetNowPlayingTvSeries _nowPlayingTvSeries;

  NowPlayingTvBloc(this._nowPlayingTvSeries)
      : super(NowPlayingTvEmpty());

  @override
  Stream<NowPlayingTvState> mapEventToState(
    NowPlayingTvEvent event,
  ) async* {
    if (event is OnLoadDataNowPlaying) {
      yield NowPlayingTvLoading();

      final nowPlaying = await _nowPlayingTvSeries.execute();

      yield* nowPlaying.fold(
        (failure) async* {
          yield NowPlayingTvError(failure.message);
        },
        (nowPlayingTvSeries) async* {
          yield NowPlayingTvHasData(nowPlayingTvSeries);
        },
      );
    }
  }
}
