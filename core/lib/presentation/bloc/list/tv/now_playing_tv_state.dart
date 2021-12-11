part of 'now_playing_tv_bloc.dart';

@immutable
abstract class NowPlayingTvState extends Equatable {
  const NowPlayingTvState();

  @override
  List<Object> get props => [];
}

class NowPlayingTvInitial extends NowPlayingTvState {}

class NowPlayingTvEmpty extends NowPlayingTvState {}

class NowPlayingTvLoading extends NowPlayingTvState {}

class NowPlayingTvError extends NowPlayingTvState {
  final String message;

  NowPlayingTvError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingTvHasData extends NowPlayingTvState {
  final List<TvSeries> tvSeries;

  NowPlayingTvHasData(this.tvSeries);

  @override
  List<Object> get props => [tvSeries];
}
