import 'package:flutter/material.dart';
import 'package:movieapp/features/movie/domain/entities/movieDetail.dart';

class TimeAndGenre extends StatelessWidget {
  final MovieDetail movieDetail;
  final int runtime;
  const TimeAndGenre({
    Key? key,
    required this.movieDetail,
    required this.runtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numOfGenre = movieDetail.genres.length;
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 7),
      child: Row(
        children: [
          SizedBox(
              child: Icon(
            Icons.watch_later_outlined,
            color: Colors.white,
          )),
          SizedBox(
            width: 5,
          ),
          Text("$runtime min", style: TextStyle(color: Colors.white)),
          SizedBox(
            width: 30,
          ),
          Chip(
              label: Text("${movieDetail.genres[0].name}"),
              backgroundColor: Colors.grey),
          SizedBox(
            width: 10,
          ),
          numOfGenre >= 2
              ? Chip(
                  label: Text(" ${movieDetail.genres[1].name}"),
                  backgroundColor: Colors.grey)
              : SizedBox(),
          SizedBox(
            width: 10,
          ),
          numOfGenre >= 3
              ? Chip(
                  label: Text(" ${movieDetail.genres[2].name}"),
                  backgroundColor: Colors.grey)
              : SizedBox(),
        ],
      ),
    );
  }
}
