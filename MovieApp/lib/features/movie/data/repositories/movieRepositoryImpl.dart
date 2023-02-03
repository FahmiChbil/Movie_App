import 'package:movieapp/core/Network/networInfo.dart';
import 'package:movieapp/core/db/db_setup.dart';
import 'package:movieapp/core/db/mongodb.dart';
import 'package:movieapp/core/errors/exceptions.dart';
import 'package:movieapp/features/movie/data/datasources/movie_local_data_source.dart';
import 'package:movieapp/features/movie/data/datasources/movie_remote_data_source.dart';

import 'package:movieapp/features/movie/domain/entities/movieDetail.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/entities/images.dart';
import 'package:movieapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/entities/one_cast.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';

class MovierepositoryImpl implements MovieRepository {
  final MovieLocalDataSource localDataSource;
  final MovieRemoteDataSource movieRemoteDataSource;
  final NetworkInfo networkInfo;
  MovierepositoryImpl(
      {required this.localDataSource,
      required this.movieRemoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, Imagess>> getMovieImages(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final movieImages = await movieRemoteDataSource.getMovieImages(id);
        return right(movieImages);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflinFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieRecommendation(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final movieRecommendation =
            await movieRemoteDataSource.getMovieRecommendation(id);
        return right(movieRecommendation);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflinFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    if (await networkInfo.isConnected) {
      try {
        localDataSource.insertData(
            await movieRemoteDataSource.getNowPlayingMovies(),
            MongoDataBase.nowPlayingCollection);
        // final localPosts = await localDataSource.getCachedMovies();
        final localMovies = await localDataSource
            .getDataFromDB(MongoDataBase.nowPlayingCollection);
        return right(localMovies);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflinFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        localDataSource.insertData(
            await movieRemoteDataSource.getPopularMovies(),
            MongoDataBase.popularCollection);
        // final localPosts = await localDataSource.getCachedMovies();
        final localMovies = await localDataSource
            .getDataFromDB(MongoDataBase.popularCollection);
        return right(localMovies);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflinFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    if (await networkInfo.isConnected) {
      try {
        localDataSource.insertData(
            await movieRemoteDataSource.getTopRatedMovies(),
            MongoDataBase.topratedCollection);
        // final localPosts = await localDataSource.getCachedMovies();
        final localMovies = await localDataSource
            .getDataFromDB(MongoDataBase.topratedCollection);
        return right(localMovies);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflinFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getmMovieDetail(int? id) async {
    if (await networkInfo.isConnected) {
      try {
        final movieDetail = await movieRemoteDataSource.getmMovieDetail(id);
        return right(movieDetail);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflinFailure());
    }
  }

  @override
  Stream<List<Movie>> getStreamData() async* {
    // localDataSource.insertData(
    //     await movieRemoteDataSource.getStreamData(),
    //     MongoDataBase.popularCollection);
    // // final localPosts = await localDataSource.getCachedMovies();
    // final localMovies = await localDataSource
    //     .getDataFromDB(MongoDataBase.popularCollection);
    final localMovies = await movieRemoteDataSource.getStreamData();
    yield* localMovies;
  }

  @override
  Future<Either<Failure, List<Cast>>> getCasts(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final movieCasts = await movieRemoteDataSource.getCasts(id);
        return right(movieCasts);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflinFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpComingMovie() async {
    if (await networkInfo.isConnected) {
      try {
        final upcomingMovie = await movieRemoteDataSource.getUpComingMovie();
        return right(upcomingMovie);
      } on ServerException {
        return left(OfflinFailure());
      }
    } else
      return left(OfflinFailure());
  }
}
