import 'package:flutter/material.dart';

class ImageAndTitle extends StatelessWidget {
  final String image;
  final String title;
  final String releaseDate;
  const ImageAndTitle({
    Key? key,
    required this.image,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 180,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500$image',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          RichText(
            text: TextSpan(
                text: title,
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                      text: "\n$releaseDate",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold))
                ]),
          ),
        ],
      ),
    );
  }
}
