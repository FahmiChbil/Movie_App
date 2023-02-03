import 'package:flutter/material.dart';

import 'package:movieapp/features/movie/data/models/movieModel.dart';

import 'loaded_widget.dart';

class NowPlayingMovieList extends StatelessWidget {
  final String text;
  final List<MovieModel>? movies;
  NowPlayingMovieList({
    Key? key,
    required this.movies,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Loadedwidg(text: text, movies: movies);
    ;
  }
}
