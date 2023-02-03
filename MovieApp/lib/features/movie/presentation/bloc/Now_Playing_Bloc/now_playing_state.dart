part of 'now_playing_bloc.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class LoadingNowPlayingState extends NowPlayingState {}

class LoadedNowPlayingState extends NowPlayingState {
  List<Movie> movies;
  LoadedNowPlayingState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class ErrorNowPlayingState extends NowPlayingState {
  String message;
  ErrorNowPlayingState({required this.message});
  @override
  List<Object> get props => [message];
}
