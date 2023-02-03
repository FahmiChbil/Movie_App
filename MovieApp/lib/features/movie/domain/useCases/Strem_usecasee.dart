import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repositories/movieRepository.dart';

class GetStreamMoviesUserCase {
  final MovieRepository movieRepository;

  GetStreamMoviesUserCase(this.movieRepository);

  Stream<List<Movie>> call() async* {
    yield* movieRepository.getStreamData();
  }
}
