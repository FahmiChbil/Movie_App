import 'package:movieapp/features/movie/data/models/genre_model.dart';
import 'package:movieapp/features/movie/domain/entities/genre.dart';

import '../../domain/entities/movieDetail.dart';

class MovieDetailModel extends MovieDetail {
  MovieDetailModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.status,
      required super.budget,
      required super.revenue,
      required super.posterPath,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.voteCount});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
        backdropPath: json['backdrop_path'],
        genres: (json['genres'] as List)
            .map((e) => GenreModel.fromJson(e))
            .toList(),
        id: json['id'],
        overview: json['overview'],
        status: json['status'],
        budget: json['budget'],
        revenue: json['revenue'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
