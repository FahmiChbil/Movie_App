import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/useCases/getNowPlayingUserCase.dart';

import '../../../../../core/Strings/failures.dart';
import '../../../../../core/errors/failures.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlayingUserCase getNowPlayingUserCase;
  NowPlayingBloc({required this.getNowPlayingUserCase})
      : super(NowPlayingInitial()) {
    on<NowPlayingEvent>((event, emit) async {
      if (event is GetNowPlayingEvent) {}
      emit(LoadingNowPlayingState());
      final failureOrNowPlayingMovies = await getNowPlayingUserCase();
      emit(mapFailureOrMoviesToState(failureOrNowPlayingMovies));
    });
  }
}

NowPlayingState mapFailureOrMoviesToState(Either<Failure, List<Movie>> either) {
  return either.fold(
      (Failure) => ErrorNowPlayingState(message: mapFailureToMessage(Failure)),
      (movie) => LoadedNowPlayingState(movies: movie));
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
