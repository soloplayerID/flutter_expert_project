import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:popular/domain/usecases/get_popular_tvseries.dart';

part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvSeriesBloc
    extends Bloc<PopularTvSeriesEvent, PopularTvSeriesState> {
  final GetPopularTvSeries _popularTvSeries;

  PopularTvSeriesBloc(this._popularTvSeries)
      : super(PopularTvSeriesEmpty());

  @override
  Stream<PopularTvSeriesState> mapEventToState(
    PopularTvSeriesEvent event,
  ) async* {
    if (event is OnLoadDataPopular) {
      yield PopularTvSeriesLoading();

      final popular = await _popularTvSeries.execute();

      yield* popular.fold(
        (failure) async* {
          yield PopularTvSeriesError(failure.message);
        },
        (popularTvSeries) async* {
          yield PopularTvSeriesHasData(popularTvSeries);
        },
      );
    }
  }
}
