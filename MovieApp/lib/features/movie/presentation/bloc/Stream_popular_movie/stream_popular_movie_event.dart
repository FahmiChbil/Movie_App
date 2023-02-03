part of 'stream_popular_movie_bloc.dart';

abstract class StreamPopularMovieEvent extends Equatable {
  const StreamPopularMovieEvent();

  @override
  List<Object> get props => [];
}

class getStreamPopularMoviesEvent extends StreamPopularMovieEvent {}
