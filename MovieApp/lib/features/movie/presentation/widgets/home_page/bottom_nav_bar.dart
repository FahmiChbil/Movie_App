import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';
import 'botoom_nav_bar-home.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static List<Movie?>? movies;

  List items = [
    Scaffold(body: BottomNavBarHome()),
    Center(
      child: Text("in configuratin"),
    ),
    Center(
      child: Text("in configuratin"),
    ),
    Center(
      child: Text("in configuratin"),
    )
  ];

  int _curent = 0;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: items.elementAt(_curent),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _curent,
            onTap: (value) {
              setState(() {
                _curent = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.type_specimen, color: Colors.black),
                label: "genres",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.black),
                label: "search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_search, color: Colors.black),
                label: "account",
              ),
            ]),
      ),
    );
  }
}
