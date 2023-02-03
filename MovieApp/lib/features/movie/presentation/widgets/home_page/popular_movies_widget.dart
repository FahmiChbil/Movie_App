import 'package:flutter/material.dart';

import 'package:movieapp/features/movie/data/models/movieModel.dart';

import 'loaded_widget.dart';

class PopularMovieList extends StatelessWidget {
  final List<MovieModel>? movies;
  PopularMovieList({
    Key? key,
    required this.text,
    this.movies,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Loadedwidg(text: text, movies: movies);
  }
}
