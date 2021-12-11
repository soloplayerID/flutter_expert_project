part of 'popular_tv_bloc.dart';

@immutable
abstract class PopularTvSeriesEvent extends Equatable {
  const PopularTvSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnLoadDataPopular extends PopularTvSeriesEvent {}
