import 'package:flutter/material.dart';
import 'package:movieapp/features/movie/presentation/widgets/home_page/loading_widget.dart';

import 'package:movieapp/features/movie/presentation/widgets/home_page/top_rated_movie.dart';

import '../../../data/datasources/movie_remote_data_source.dart';
import '../../../data/models/movieModel.dart';
import '../../../data/repositories/movieRepositoryImpl.dart';
import 'customScrol.dart';

import 'now_playing_movie.dart';
import 'popular_movies_widget.dart';

class BottomNavBarHome extends StatelessWidget {
  BottomNavBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: MovieRemoteDataSourceImpl().getUpComingMovie(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return Stack(
                          children: [
                            Container(
                                width: double.infinity,
                                child: MyCaroussel(movies: snapshot.data)),
                          ],
                        );
                      }
                      return Loadingwidg(text: "");
                    }))),
            Expanded(
                child: FutureBuilder(
                    future: MovieRemoteDataSourceImpl().getNowPlayingMovies(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return NowPlayingMovieList(
                            text: "Now Playing movie list",
                            movies: snapshot.data);
                      }
                      return Loadingwidg(text: "Now Playing movie list");
                    }))),
            Expanded(
                child: FutureBuilder(
                    future: MovieRemoteDataSourceImpl().getPopularMovies(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return PopularMovieList(
                            text: "popular movies", movies: snapshot.data);
                      }
                      return Loadingwidg(text: "popular movies");
                    }))),
            Expanded(
                child: FutureBuilder(
                    future: MovieRemoteDataSourceImpl().getTopRatedMovies(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return TopRatedMovieList(
                            text: " top rated movies", movies: snapshot.data);
                      }
                      return Loadingwidg(text: "Top rated movies");
                    })))
          ],
        ));
  }
}
