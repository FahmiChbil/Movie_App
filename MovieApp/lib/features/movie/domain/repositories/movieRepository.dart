import 'package:dartz/dartz.dart';

import 'package:movieapp/features/movie/domain/entities/images.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/entities/movieDetail.dart';
import 'package:movieapp/features/movie/domain/entities/one_cast.dart';

import '../../../../core/errors/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getUpComingMovie();
  Stream<List<Movie>> getStreamData();
  Future<Either<Failure, MovieDetail>> getmMovieDetail(int? id);
  Future<Either<Failure, List<Movie>>> getMovieRecommendation(int id);
  Future<Either<Failure, Imagess>> getMovieImages(int id);
  Future<Either<Failure, List<Cast>>> getCasts(int id);
}
