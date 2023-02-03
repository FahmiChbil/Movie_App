import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/images.dart';

class GetMovieImagesUserCase {
  MovieRepository movieRepository;
  GetMovieImagesUserCase(this.movieRepository);

  Future<Either<Failure, Imagess>> call(int id) async {
    return movieRepository.getMovieImages(id);
  }
}
