import 'package:flutter/material.dart';
import 'package:traveller/screens/app_screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  var personName;
  WelcomeScreen(this.personName);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/welcome_screen.jpg"),
        fit: BoxFit.cover,
        opacity: 0.7,
      )),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome $personName",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 2),
                Text("Traveling Around The World",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1.5,
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "“The world is a book and those who do not travel read only one page",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Ink(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
