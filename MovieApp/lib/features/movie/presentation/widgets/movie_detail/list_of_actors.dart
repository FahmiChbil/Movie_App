import 'package:flutter/material.dart';
import 'package:movieapp/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/features/movie/domain/entities/movieDetail.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/one_cast.dart';
import 'One_Actor.dart';

class listOfActors extends StatelessWidget {
  final MovieDetail? movie;

  const listOfActors({
    Key? key,
    required this.movie,
  }) : super(key: key);



  @override
  Widget build(BuildContext context)   {

    return FutureBuilder (
        future: MovieRemoteDataSourceImpl().getCasts(movie!.id) ,
        builder: ((context, snapshot) { if (snapshot.hasData) {

          return Container(
            height: 170,
            width: double.infinity,
            child: ListView.builder( padding: EdgeInsets.only(right: 5),
                itemCount: 10,
                scrollDirection: Axis.horizontal, itemBuilder: ((context, index) => OneActor(
                  imagedemo: snapshot.data![index].image,
                  actorName: snapshot.data![index].name,
                ))),
          );
        }
        return CircularProgressIndicator();
        }));


  }
}
