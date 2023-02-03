import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/one_cast.dart';

class GetCastsUseCase {
  final MovieRepository movieRepository;
  GetCastsUseCase({required this.movieRepository});
  Future<Either<Failure, List<Cast>>> call(int id) async {
    return movieRepository.getCasts(id);
  }
}
