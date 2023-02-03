import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/db/mongodb.dart';
import 'package:movieapp/core/theme.dart';
import 'package:movieapp/features/movie/presentation/bloc/Stream_popular_movie/stream_popular_movie_bloc.dart';
import 'package:movieapp/features/movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movieapp/features/movie/presentation/widgets/home_page/loading_widget.dart';

import 'features/movie/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await MongoDataBase.connect();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: ((_) => di.sl<StreamPopularMovieBloc>())),
          BlocProvider(
            create: (_) => di.sl<MovieDetailBloc>(),
          )
        ],
        child: MaterialApp(
          routes: {"loading": (context) => Loadingwidg(text: "load")},
          home: SafeArea(child: Home()),
          theme: appTheme,
        ));
  }
}
