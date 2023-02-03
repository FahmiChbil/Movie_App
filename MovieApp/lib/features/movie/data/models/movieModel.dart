import 'package:mongo_dart/mongo_dart.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.backDropPath,
      required super.genreIds,
      required super.id,
      required super.overview,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        backDropPath: json['backdrop_path'],
        genreIds: json['genre_ids'],
        id: json['id'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backDropPath,
      'genre_ids': genreIds,
      'id': id,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount
    };
  }
}
