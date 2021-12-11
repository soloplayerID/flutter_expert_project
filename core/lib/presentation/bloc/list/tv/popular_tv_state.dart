part of 'popular_tv_bloc.dart';

@immutable
abstract class PopularTvSeriesState extends Equatable {
  const PopularTvSeriesState();

  @override
  List<Object> get props => [];
}

class PopularTvSeriesInitial extends PopularTvSeriesState {}

class PopularTvSeriesEmpty extends PopularTvSeriesState {}

class PopularTvSeriesLoading extends PopularTvSeriesState {}

class PopularTvSeriesError extends PopularTvSeriesState {
  final String message;

  PopularTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularTvSeriesHasData extends PopularTvSeriesState {
  final List<TvSeries> tvSeries;

  PopularTvSeriesHasData(this.tvSeries);

  @override
  List<Object> get props => [tvSeries];
}
