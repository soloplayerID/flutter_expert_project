import 'package:core/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:core/presentation/widgets/tvseries_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist';

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WatchlistBloc>().add(OnLoadDataWatchList());
    });
  }

  void didPopNext() {
    context.read<WatchlistBloc>().add(OnLoadDataWatchList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is WatchlistLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WatchlistHasData) {
              final result = state.result;
              final resultTv = state.resultTv;
              if (result.length == 0 && resultTv.length == 0) {
                return Center(child: Text("Nothing to see here"));
              } else {
                return ListView(
                  children: <Widget>[
                    ...result.map((movie) {
                      return MovieCard(movie);
                    }).toList(),
                    ...resultTv.map((tvSeries) {
                      return TvSeriesCard(tvSeries);
                    }).toList(),
                  ],
                );
              }
            } else if (state is WatchlistError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Text("");
            }
          },
        ),
      ),
    );
  }
}
