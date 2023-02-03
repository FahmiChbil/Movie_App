import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movieapp/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/features/movie/data/models/movieModel.dart';

import '../../../domain/entities/movie.dart';
import '../../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../../pages/Movie_Detail_Page.dart';
import 'One_movie.dart';
import 'loading_widget.dart';

class Loadedwidg extends StatelessWidget {
  const Loadedwidg({
    Key? key,
    required this.text,
    required this.movies,
  }) : super(key: key);

  final String text;
  final List<MovieModel>? movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Expanded(flex: 3, child: listOfMovies(movies: movies)),
        ],
      ),
    );
  }
}

class listOfMovies extends StatelessWidget {
  List<Movie?>? movies;
  listOfMovies({
    required this.movies,
    Key? key,
  }) : super(key: key);

  List<String> images = [
    ''
        'http://image.tmdb.org/t/p/w500/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
    'https://image.tmdb.org/t/p/w500/1g0K701Z1SYJ83A34XvvfnbacTw.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => GestureDetector(
              onTap: (() {
                print("anaother tap ");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FutureBuilder(
                              future: MovieRemoteDataSourceImpl()
                                  .getmMovieDetail(movies![index]!.id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Second(movie: snapshot.data);
                                }
                                return Scaffold(
                                  body: Loadingwidg(text: ""),
                                );
                              },
                            )));
              }),
              child: oneMovie(
                imagedemo: movies![index]!.backDropPath,
              ),
            )));
  }
}
