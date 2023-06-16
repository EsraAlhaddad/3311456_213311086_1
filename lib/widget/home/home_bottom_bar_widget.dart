import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:traveller/screens/home_bottom_bar_screens/graphic_screen.dart';
import 'package:traveller/screens/home_bottom_bar_screens/note_screen.dart';
import 'package:traveller/screens/home_bottom_bar_screens/profile_screen.dart';
import 'package:traveller/screens/home_bottom_bar_screens/weather_screen.dart';
import 'package:traveller/widget/home/home_body_widget.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  var _index = 0;

  List<Widget> pages = <Widget>[
    HomeBody(),
    WeatherScreen(),
    NoteScreen(),
    PieChartPage(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_index),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 14, 40, 62),
        backgroundColor: Color.fromARGB(255, 198, 177, 197),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 250),
        index: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.sunny_snowing, size: 30, color: Colors.white),
          Icon(Icons.note_alt, size: 30, color: Colors.white),
          Icon(Icons.bar_chart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
