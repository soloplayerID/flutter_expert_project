part of 'watchlist_bloc.dart';

@immutable
abstract class WatchlistEvent {
  const WatchlistEvent();
}

class OnLoadDataWatchList extends WatchlistEvent {}
