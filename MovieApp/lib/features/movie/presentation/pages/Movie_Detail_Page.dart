import 'package:flutter/material.dart';
import 'package:movieapp/core/theme.dart';
import 'package:movieapp/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/entities/movieDetail.dart';

import '../widgets/home_page/One_movie.dart';
import '../widgets/home_page/loaded_widget.dart';
import '../widgets/movie_detail/Arrow_Back_Btn.dart';
import '../widgets/movie_detail/Casts.dart';
import '../widgets/movie_detail/One_Actor.dart';
import '../widgets/movie_detail/Overiview.dart';
import '../widgets/movie_detail/Text_Overviw.dart';
import '../widgets/movie_detail/Time_And_genre.dart';
import '../widgets/movie_detail/about_movie.dart';
import '../widgets/movie_detail/image_and_title.dart';
import '../widgets/movie_detail/list_of_actors.dart';

class Second extends StatelessWidget {
  final MovieDetail? movie;

  const Second({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500/${movie!.backdropPath}',
            height: 250,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black26,
                  Colors.black45,
                  Colors.black87,
                  Colors.black87,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black
                ])),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArrowBackBtn(),
                ImageAndTitle(
                    image: movie!.backdropPath!,
                    title: movie!.title,
                    releaseDate: movie!.releaseDate),
                TimeAndGenre(movieDetail: movie!, runtime: movie!.runtime),
                Overiview(),
                TextOverviw(overview: movie!.overview),
                FutureBuilder(
                    future: MovieRemoteDataSourceImpl().getCasts(movie!.id),
                    builder: (context, snapshot) => Casts(
                  movie: movie!,
                ),),
                AboutMovie(
                  Status: movie!.status,
                  budget: movie!.budget,
                  revenue: movie!.revenue,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class SimilarMivies extends StatelessWidget {
  final List<Movie?>? movie;

  const SimilarMivies({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 7, right: 7),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 4, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("   SIMILAR MOVIES",
                  style: Theme.of(context).textTheme.headline1),
              SizedBox(
                height: 20,
              ),
              listOfMovies(movies: movie)
            ],
          ),
        ),
      ),
    );
  }
}
