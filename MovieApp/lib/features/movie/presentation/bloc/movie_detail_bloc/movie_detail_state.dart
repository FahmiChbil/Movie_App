part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class LoadingMovieDetaiState extends MovieDetailState {}

class LoadedMovieDetailState extends MovieDetailState {
  MovieDetail movieDetail;
  LoadedMovieDetailState({required this.movieDetail});
  @override
  List<Object> get props => [movieDetail];
}

class ErrorMovieDetailState extends MovieDetailState {
  String message;
  ErrorMovieDetailState({required this.message});
  @override
  List<Object> get props => [message];
}
