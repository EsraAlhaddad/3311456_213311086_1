import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Color.fromARGB(255, 14, 40, 62),
      backgroundColor: Color.fromARGB(255, 198, 177, 197),
      animationDuration: Duration(milliseconds: 250),
      index: 2,
      items: [
        Icon(Icons.person_outline, size: 30, color: Colors.white),
        Icon(Icons.favorite_outline, size: 30, color: Colors.white),
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.location_on_rounded, size: 30, color: Colors.white),
        Icon(Icons.list, size: 30, color: Colors.white),
      ],
    );
  }
}
