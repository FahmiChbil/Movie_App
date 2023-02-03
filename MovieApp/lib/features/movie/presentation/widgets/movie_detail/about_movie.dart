import 'package:flutter/material.dart';

class AboutMovie extends StatelessWidget {
  final String Status;
  final int budget;
  final int revenue;
  const AboutMovie({
    Key? key,
    required this.Status,
    required this.budget,
    required this.revenue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ABOUT MOVIE",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 15,
            child: StatusAndRevenu(leading: "Status", Trailing: Status),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 15,
              child: StatusAndRevenu(leading: "Budget", Trailing: "£$budget")),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 15,
              child: StatusAndRevenu(leading: "Revenue", Trailing: "£$revenue"))
        ],
      ),
    );
  }
}

class StatusAndRevenu extends StatelessWidget {
  final String leading;
  final String Trailing;
  const StatusAndRevenu({
    Key? key,
    required this.leading,
    required this.Trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(
          leading,
          style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        trailing: Text(Trailing,
            style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.bold)));
  }
}
