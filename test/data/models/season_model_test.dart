import 'dart:convert';

import 'package:ditonton/data/models/season_model.dart';
import 'package:ditonton/domain/entities/episode.dart';
import 'package:ditonton/domain/entities/season_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tSeasonDetailModel = SeasonModel(
    id: 'id',
    airDate: 'airDate',
    episodes: [],
    name: 'name',
    seasonModelId: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 1,
  );

  final tSeasonDetail = SeasonDetail(
    id: 'id',
    airDate: 'airDate',
    episodes: [],
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 1,
  );

  final tSeasonDetailResponse = SeasonModel(
    id: "5f3b23f566e46900354ac0a5",
    airDate: "2020-09-13",
    episodes: [],
    name: "Season 1",
    overview: "",
    seasonModelId: 159392,
    posterPath: "/2UuRWSoLCTohtKOTpKI1lwL5GrD.jpg",
    seasonNumber: 1,
  );

  final tEpisodeDetailResponse = Episode(
    airDate: "2020-09-14",
    episodeNumber: 1,
    id: 2392727,
    name: "Episode 1",
    overview: '',
    seasonNumber: 1,
    productionCode: '',
    stillPath: "/d5dVLqGdRtthkiMoJPCuctAKrBX.jpg",
    voteAverage: 0,
    voteCount: 0,
  );

  test('should be a subclass of Tv series Season Detail entity', () async {
    final result = tSeasonDetailModel.toEntity();
    expect(result, tSeasonDetail);
  });

  group('SeasonDetail fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_series/season.json'));
      // act
      final result = SeasonModel.fromJson(jsonMap);
      // assert
      expect(result, tSeasonDetailResponse);
    });
  });

  group('SeasonDetail toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tSeasonDetailModel.toJson();
      // assert
      final expectedJsonMap = {
        "_id": "id",
        "air_date": "airDate",
        "episodes": [],
        "name": "name",
        "overview": "overview",
        "id": 1,
        "poster_path": "posterPath",
        "season_number": 1
      };
      expect(result, expectedJsonMap);
    });
  });
}
