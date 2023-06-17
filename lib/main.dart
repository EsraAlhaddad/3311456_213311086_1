import 'package:flutter/material.dart';
import 'package:traveller/widget/pages/auth.dart';
import 'package:traveller/screens/home_bottom_bar_screens/home_screen.dart';
import 'package:traveller/screens/app_screens/onbording_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("Bookmark");

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
        home: Onboarding(),
        routes: {
          "/onbording": (context) => Onboarding(),
          "/loginpage": (context) => Auth(),
          "/homescreen": (context) => HomeScreen(),
        });
  }
}
