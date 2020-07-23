import 'package:flutter/material.dart';
import 'package:aschoologye/material/constans.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavBarState();
  }
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: AsPalette.blue,
          backgroundColor: AsPalette.skyblue,
          buttonBackgroundColor: AsPalette.blue,
          height: 50,
          items: <Widget>[
            Icon(Icons.home, size: 20, color: Colors.white),
            Icon(Icons.assignment, size: 20, color: Colors.white),
            Icon(Icons.forum, size: 20, color: Colors.white),
            Icon(Icons.person_outline, size: 20, color: Colors.white),
          ],
          animationDuration: Duration(milliseconds: 200),
          index: 2,
          animationCurve: Curves.bounceInOut,
          onTap: (index) {
            debugPrint("Current Index is $index");
          },
        ),
      ),
    );
  }
}
