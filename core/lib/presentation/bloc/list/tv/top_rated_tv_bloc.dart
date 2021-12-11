import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:toprated/domain/usecases/get_top_rated_tvseries.dart';

part 'top_rated_tv_event.dart';
part 'top_rated_tv_state.dart';

class TopRatedTvSeriesBloc
    extends Bloc<TopRatedTvSeriesEvent, TopRatedTvSeriesState> {
  final GetTopRatedTvSeries _topRatedTvSeries;

  TopRatedTvSeriesBloc(this._topRatedTvSeries)
      : super(TopRatedTvSeriesEmpty());

  @override
  Stream<TopRatedTvSeriesState> mapEventToState(
    TopRatedTvSeriesEvent event,
  ) async* {
    if (event is OnLoadDataTopRated) {
      yield TopRatedTvSeriesLoading();

      final topRated = await _topRatedTvSeries.execute();

      yield* topRated.fold(
        (failure) async* {
          yield TopRatedTvSeriesError(failure.message);
        },
        (topRatedTvSeriess) async* {
          yield TopRatedTvSeriesHasData(topRatedTvSeriess);
        },
      );
    }
  }
}
