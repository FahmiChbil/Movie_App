import 'package:flutter/material.dart';

class OneActor extends StatelessWidget {
  final String? imagedemo;
  final String actorName;
  const OneActor({Key? key, this.imagedemo, required this.actorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: imagedemo == null
                      ? Center(
                          child: Text("image was not provided"),
                        )
                      : Image.network(
                          'http://image.tmdb.org/t/p/w500$imagedemo',
                          fit: BoxFit.cover,
                        )),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        Positioned(
            bottom: 20,
            left: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                actorName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
                maxLines: 2,
              ),
            ))
      ],
    );
  }
}
