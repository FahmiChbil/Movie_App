part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class LoadingPopularMoviesState extends PopularMoviesState {}

class LoadedPopularMovieState extends PopularMoviesState {
  List<Movie> movies;
  LoadedPopularMovieState({required this.movies});
  @override
  List<Object> get props => [movies];
}

class ErrorPopularMovieState extends PopularMoviesState {
  String message;
  ErrorPopularMovieState({required this.message});
  @override
  List<Object> get props => [message];
}
