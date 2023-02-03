import 'package:dartz/dartz.dart';

import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';

class GetPopularMoviesUserCase {
  final MovieRepository movieRepository;

  GetPopularMoviesUserCase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return movieRepository.getPopularMovies();
  }
}
