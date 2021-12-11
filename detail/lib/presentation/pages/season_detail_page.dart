import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/utils/constants.dart';
import 'package:core/data/models/season_model.dart';
import 'package:core/domain/entities/season_detail.dart';
import 'package:detail/presentation/bloc/season_tvseries/season_tv_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:core/styles/text_styles.dart';

class SeasonDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-season';

  final int tvId, seasonNum;
  SeasonDetailPage({required this.tvId, required this.seasonNum});

  @override
  _SeasonDetailPageState createState() => _SeasonDetailPageState();
}

class _SeasonDetailPageState extends State<SeasonDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<SeasonTvBloc>()
          .add(OnLoadData(widget.tvId, widget.seasonNum));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Season'),
      ),
      body: BlocBuilder<SeasonTvBloc, SeasonTvState>(
        builder: (context, state) {
          if (state is SeasonLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SeasonHasData) {
            final season = state.result;
            return SafeArea(
              child: SingleChildScrollView(
                child: SeasonContent(season),
              ),
            );
          } else if (state is SeasonError) {
            return Expanded(
              child: Center(
                child: Text(
                  state.message,
                  key: Key('error_message'),
                ),
              ),
            );
          } else {
            return Expanded(
              child: Container(),
            );
          }
        },
      ),
    );
  }
}

class SeasonContent extends StatelessWidget {
  final SeasonDetail season;

  SeasonContent(this.season);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 30.0),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
              ),
              child: Text(
                season.name,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: season.posterPath == null
                    ? 'https://via.placeholder.com/120x180?text=No+Image'
                    : '$BASE_IMAGE_URL${season.posterPath}',
                width: 170,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    'Overview',
                    style: kHeading6,
                  ),
                ),
                Text(
                  season.overview == ""
                      ? "[There's no overview]"
                      : season.overview,
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    'Episodes',
                    style: kHeading6,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ...season.episodes.map((episode) {
                        return EpisodeContent(episode);
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EpisodeContent extends StatelessWidget {
  final Episode episode;

  EpisodeContent(this.episode);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: Colors.blueGrey[900]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                episode.name,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Episode ' + episode.episodeNumber.toString()),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 4.0),
                              decoration: BoxDecoration(color: Colors.yellow),
                              child: Text(
                                'Air Date',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          episode.airDate ?? "-",
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: episode.stillPath == null
                            ? 'https://via.placeholder.com/180x120?text=No+Image'
                            : '$BASE_IMAGE_URL${episode.stillPath}',
                        width: 150,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: Text(
                      'Overview',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Text(
                episode.overview == ""
                    ? "[There's no overview]"
                    : episode.overview,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
