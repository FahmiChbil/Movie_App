part of 'stream_popular_movie_bloc.dart';

abstract class StreamPopularMovieState extends Equatable {
  const StreamPopularMovieState();

  @override
  List<Object> get props => [];
}

class StreamPopularMovieInitial extends StreamPopularMovieState {}

class LoadingStreamPopularState extends StreamPopularMovieState {}

class LoadedStreamPopularState extends StreamPopularMovieState {
  Stream<List<Movie>> movies;
  LoadedStreamPopularState({required this.movies});
  @override
  List<Object> get props => [movies];
}

class ErrorStreamPopularMovieState extends StreamPopularMovieState {
  String message;
  ErrorStreamPopularMovieState({required this.message});
  @override
  List<Object> get props => [message];
}
