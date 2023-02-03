import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';

class GetNowPlayingUserCase {
  final MovieRepository movieRepository;

  GetNowPlayingUserCase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return movieRepository.getNowPlayingMovies();
  }
}
