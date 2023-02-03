import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/useCases/getTopRatedMovies.dart';

import '../../../../../core/Strings/failures.dart';
import '../../../../../core/errors/failures.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMoviesUserCase getTopRatedMoviesUserCase;

  TopRatedMoviesBloc({required this.getTopRatedMoviesUserCase})
      : super(TopRatedMoviesInitial()) {
    on<TopRatedMoviesEvent>((event, emit) async {
      if (event is GetTopRatedMoviesEvent) {
        emit(LoadingTopRatedMoviesState());
        final failureOrTopRatedMovies = await getTopRatedMoviesUserCase();
        emit(mapFailureOrMoviesToState(failureOrTopRatedMovies));
      }
    });
  }
}

TopRatedMoviesState mapFailureOrMoviesToState(
    Either<Failure, List<Movie>> either) {
  return either.fold(
      (Failure) =>
          ErrorTopRatingMoviesState(message: mapFailureToMessage(Failure)),
      (movie) => LoadedTopRatingMoviesState(movies: movie));
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
