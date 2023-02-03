import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

import '../../../../core/errors/failures.dart';

class GetMovieRecommendationUserCase {
  final MovieRepository movieRepository;

  GetMovieRecommendationUserCase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call(int id) async {
    return movieRepository.getMovieRecommendation(id);
  }
}
