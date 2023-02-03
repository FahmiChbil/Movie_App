import 'package:flutter/material.dart';

class ArrowBackBtn extends StatelessWidget {
  const ArrowBackBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          )),
    );
  }
}
