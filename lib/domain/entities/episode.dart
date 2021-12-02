import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodeNumber,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  final int id;
  final String name;
  final String airDate;
  final int episodeNumber;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        id,
        name,
        airDate,
        episodeNumber,
        overview,
        productionCode,
        seasonNumber,
        stillPath,
        voteAverage,
        voteCount
      ];

  toJson() {}

  static fromJson(x) {}
}
