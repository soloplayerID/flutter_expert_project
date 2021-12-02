import 'package:ditonton/domain/entities/episode.dart';
import 'package:ditonton/domain/entities/season_detail.dart';
import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  SeasonModel({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.seasonModelId,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String id;
  final String airDate;
  final List<Episode> episodes;
  final String name;
  final String overview;
  final int seasonModelId;
  final String? posterPath;
  final int seasonNumber;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        id: json["_id"],
        airDate: json["air_date"],
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
        name: json["name"],
        overview: json["overview"],
        seasonModelId: json["id"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "air_date": airDate,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
        "name": name,
        "overview": overview,
        "id": seasonModelId,
        "poster_path": posterPath,
        "season_number": seasonNumber,
      };

  SeasonDetail toEntity() {
    return SeasonDetail(
      id: this.id,
      airDate: this.airDate,
      episodes: this.episodes,
      name: this.name,
      overview: this.overview,
      posterPath: this.posterPath,
      seasonNumber: this.seasonNumber,
    );
  }

  @override
  List<Object?> get props => [
        id,
        airDate,
        episodes,
        name,
        overview,
        seasonModelId,
        posterPath,
        seasonNumber,
      ];
}
