import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movieapp/core/Network/networInfo.dart';
import 'package:movieapp/features/movie/data/datasources/movie_local_data_source.dart';
import 'package:movieapp/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/features/movie/data/repositories/movieRepositoryImpl.dart';
import 'package:movieapp/features/movie/domain/repositories/movieRepository.dart';
import 'package:movieapp/features/movie/domain/useCases/Strem_usecasee.dart';
import 'package:movieapp/features/movie/domain/useCases/getMoviedDetail.dart';
import 'package:movieapp/features/movie/domain/useCases/getNowPlayingUserCase.dart';
import 'package:movieapp/features/movie/domain/useCases/getPopularMovies.dart';
import 'package:movieapp/features/movie/domain/useCases/getTopRatedMovies.dart';
import 'package:movieapp/features/movie/presentation/bloc/Now_Playing_Bloc/now_playing_bloc.dart';
import 'package:movieapp/features/movie/presentation/bloc/Stream_popular_movie/stream_popular_movie_bloc.dart';
import 'package:movieapp/features/movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movieapp/features/movie/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movieapp/features/movie/presentation/bloc/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
// features movies

// bloc

  sl.registerFactory(() => PopularMoviesBloc(getPopularMoviesUserCase: sl()));
  sl.registerFactory(() => NowPlayingBloc(getNowPlayingUserCase: sl()));
  sl.registerFactory(() => TopRatedMoviesBloc(getTopRatedMoviesUserCase: sl()));
  sl.registerFactory(() => MovieDetailBloc(getMovieDetailUserCase: sl()));
  sl.registerFactory(
      () => StreamPopularMovieBloc(getStreamMoviesUserCase: sl()));

  // useCases

  sl.registerLazySingleton(() => GetNowPlayingUserCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUserCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUserCase(sl()));
  sl.registerLazySingleton(() => GetStreamMoviesUserCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailUserCase(sl()));

  // repository
  sl.registerLazySingleton<MovieRepository>(() => MovierepositoryImpl(
      localDataSource: sl(), movieRemoteDataSource: sl(), networkInfo: sl()));

  // dataSources

  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl());
  sl.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  // core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
