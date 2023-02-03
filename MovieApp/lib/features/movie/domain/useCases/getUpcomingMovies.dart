import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repositories/movieRepository.dart';

class GetUpComingMovie {
  final MovieRepository movieRepository;

  GetUpComingMovie(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return movieRepository.getPopularMovies();
  }
}
