import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movieapp/features/movie/presentation/bloc/Stream_popular_movie/stream_popular_movie_bloc.dart';

import '../widgets/home_page/botoom_nav_bar-home.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BottomNavBarHome();
  }
}

// Widget _buildBody() {
//   return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
//     builder: (context, state) {
//       if (state is LoadingPopularMoviesState) {

//       } else if (state is LoadedPopularMovieState) {
//         return
//       } else if (state is ErrorPopularMovieState) {
//         return Text(state.message.toString());
//       }
//       return CircularProgressIndicator();
//     },
//   );
// }

class GetOneData extends StatelessWidget {
  const GetOneData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: BlocBuilder<StreamPopularMovieBloc, StreamPopularMovieState>(
          builder: (context, state) {
            if (state is LoadingStreamPopularState) {
              return CircularProgressIndicator();
            } else if (state is LoadedStreamPopularState) {
              return Text(
                  state.movies.listen((event) => event[0].title).toString());
            }
            return CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
