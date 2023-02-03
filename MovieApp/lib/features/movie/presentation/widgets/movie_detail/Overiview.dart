import 'package:flutter/material.dart';

class Overiview extends StatelessWidget {
  const Overiview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 7),
      child: Text(
        "OVERVIEW",
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
