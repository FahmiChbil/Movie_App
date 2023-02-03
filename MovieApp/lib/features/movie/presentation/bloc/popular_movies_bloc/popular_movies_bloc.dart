import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/useCases/getPopularMovies.dart';

import '../../../../../core/Strings/failures.dart';
import '../../../../../core/errors/failures.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUserCase getPopularMoviesUserCase;
  PopularMoviesBloc({required this.getPopularMoviesUserCase})
      : super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>((event, emit) async {
      if (event is GetPopularMoviesEvent) {
        emit(LoadingPopularMoviesState());
        final failureOrPopularMovies = await getPopularMoviesUserCase();
        emit(mapFailureOrMoviesToState(failureOrPopularMovies));
      }
    });
  }
}

PopularMoviesState mapFailureOrMoviesToState(
    Either<Failure, List<Movie>> either) {
  return either.fold(
      (Failure) =>
          ErrorPopularMovieState(message: mapFailureToMessage(Failure)),
      (movie) => LoadedPopularMovieState(movies: movie));
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case OfflinFailure:
      return OFFLINE_FAILURE_MESSAGE;

    default:
      return "unexpected error";
  }
}
