import 'package:flutter/material.dart';

class TextOverviw extends StatelessWidget {
  final String overview;
  const TextOverviw({
    Key? key,
    required this.overview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, top: 10),
      child: Text(
        overview,
        style: TextStyle(
            height: 1.5,
            color: Colors.white54,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        maxLines: 4,
      ),
    );
  }
}
