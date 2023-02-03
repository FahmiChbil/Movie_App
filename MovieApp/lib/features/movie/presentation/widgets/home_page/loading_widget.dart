import 'package:flutter/material.dart';

class Loadingwidg extends StatelessWidget {
  const Loadingwidg({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ))
        ],
      ),
    );
  }
}
