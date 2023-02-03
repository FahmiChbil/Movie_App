import 'package:flutter/material.dart';
import 'package:movieapp/features/movie/domain/entities/movieDetail.dart';

import '../../../domain/entities/movie.dart';
import 'list_of_actors.dart';

class Casts extends StatelessWidget {
  final MovieDetail movie ;
  const Casts({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45, left: 7, right: 7),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 4, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("   CASTS", style: Theme.of(context).textTheme.headline1),
              SizedBox(
                height: 20,
              ),
              listOfActors(movie: movie)
            ],
          ),
        ),
      ),
    );
  }
}
