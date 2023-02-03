import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  String? backDropPath;
  List<dynamic>? genreIds;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String title;
  dynamic voteAverage;
  int? voteCount;

  Movie({
    required this.backDropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        backDropPath,
        genreIds,
        id,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount
      ];
}
