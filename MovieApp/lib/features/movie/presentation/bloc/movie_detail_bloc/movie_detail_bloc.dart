import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/Strings/failures.dart';
import 'package:movieapp/features/movie/domain/entities/movieDetail.dart';
import 'package:movieapp/features/movie/domain/useCases/getMoviedDetail.dart';

import '../../../../../core/errors/failures.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUserCase getMovieDetailUserCase;
  MovieDetailBloc({required this.getMovieDetailUserCase})
      : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) async {
      if (event is GetMovieDetailEvent) {
        emit(LoadingMovieDetaiState());
        final failureOrMovieDetail = await getMovieDetailUserCase(event.id);
        emit(mapFailureOrMoviesToState(failureOrMovieDetail));
      }
    });
  }
}

MovieDetailState mapFailureOrMoviesToState(
    Either<Failure, MovieDetail> either) {
  return either.fold(
      (Failure) => ErrorMovieDetailState(message: mapFailureToMessage(Failure)),
      (movie) => LoadedMovieDetailState(movieDetail: movie));
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
