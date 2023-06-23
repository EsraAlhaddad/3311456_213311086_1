import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traveller/screens/app_screens/signin_screen.dart';
import 'package:traveller/screens/app_screens/welcome_screen.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, SnapShot) {
        if (SnapShot.hasData) {
          return WelcomeScreen();
        } else {
          return SigInScreen();
        }
      }),
    ));
  }
}
