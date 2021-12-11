part of 'top_rated_tv_bloc.dart';

@immutable
abstract class TopRatedTvSeriesEvent extends Equatable {
  const TopRatedTvSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnLoadDataTopRated extends TopRatedTvSeriesEvent {}
