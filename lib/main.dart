import 'package:flutter/material.dart';
import 'package:traveller/screens/app_screens/home_screen.dart';
import 'package:traveller/screens/app_screens/login_screen.dart';
import 'package:traveller/screens/app_screens/onbording_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Onbording(),
      routes: {
        "/onbording": (context) => Onbording(),
        "/loginpage": (context) => Login(),
        "/homescreen": (context) => HomeScreen(),
      },
    );
  }
}
