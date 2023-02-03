import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/features/movie/domain/useCases/Strem_usecasee.dart';

import '../../../domain/entities/movie.dart';

part 'stream_popular_movie_event.dart';
part 'stream_popular_movie_state.dart';

class StreamPopularMovieBloc
    extends Bloc<StreamPopularMovieEvent, StreamPopularMovieState> {
  final GetStreamMoviesUserCase getStreamMoviesUserCase;
  StreamPopularMovieBloc({required this.getStreamMoviesUserCase})
      : super(StreamPopularMovieInitial()) {
    on<StreamPopularMovieEvent>((event, emit) async {
      if (event is getStreamPopularMoviesEvent) {
        emit(LoadingStreamPopularState());
        final failureOrPopularMovies = await getStreamMoviesUserCase();
        emit(LoadedStreamPopularState(movies: failureOrPopularMovies));
      }
    });
  }
}
