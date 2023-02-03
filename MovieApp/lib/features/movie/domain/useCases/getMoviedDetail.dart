import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movieDetail.dart';

class GetMovieDetailUserCase {
  final MovieRepository movieRepository;
  GetMovieDetailUserCase(this.movieRepository);

  Future<Either<Failure, MovieDetail>> call(int? id) async {
    return movieRepository.getmMovieDetail(id);
  }
}
