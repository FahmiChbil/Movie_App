import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/features/movie/data/models/movieModel.dart';

import 'expl.dart';

class MyCaroussel extends StatelessWidget {
  final List<MovieModel>? movies;
  const MyCaroussel({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, realIndex) => SizedBox(
        height: 300,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'http://image.tmdb.org/t/p/w780${movies![index].backDropPath!}',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: Text(
                movies![index].title,
                style: TextStyle(
                    color: Colors.white54, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 3),
        viewportFraction: 1,
        enlargeCenterPage: false,
        // autoPlay: false,
      ),
    );
  }
}
