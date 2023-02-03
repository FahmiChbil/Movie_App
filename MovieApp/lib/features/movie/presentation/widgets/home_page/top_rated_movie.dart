import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/movie/data/models/movieModel.dart';

import 'loaded_widget.dart';

class TopRatedMovieList extends StatelessWidget {
  final List<MovieModel>? movies;
  TopRatedMovieList({
    Key? key,
    required this.text,
    required this.movies,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Loadedwidg(text: text, movies: movies);
  }
}
