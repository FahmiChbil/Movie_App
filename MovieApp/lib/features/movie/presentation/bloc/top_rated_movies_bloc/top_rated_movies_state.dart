part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class LoadingTopRatedMoviesState extends TopRatedMoviesState {}

class LoadedTopRatingMoviesState extends TopRatedMoviesState {
  List<Movie> movies;
  LoadedTopRatingMoviesState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class ErrorTopRatingMoviesState extends TopRatedMoviesState {
  String message;
  ErrorTopRatingMoviesState({required this.message});

  @override
  List<Object> get props => [message];
}
