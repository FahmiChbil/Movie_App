import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

import '../../../../core/errors/failures.dart';

class GetTopRatedMoviesUserCase {
  final MovieRepository movieRepository;

  GetTopRatedMoviesUserCase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return movieRepository.getTopRatedMovies();
  }
}
