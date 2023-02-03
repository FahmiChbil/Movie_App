import 'package:flutter/material.dart';

class oneMovie extends StatelessWidget {
  final String? imagedemo;

  const oneMovie({
    Key? key,
    required this.imagedemo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imagedemo);
    return Row(
      children: [
        SizedBox(
          height: 200,
          width: 125,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'http://image.tmdb.org/t/p/w500$imagedemo',
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
