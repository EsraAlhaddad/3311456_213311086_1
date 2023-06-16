import 'package:flutter/material.dart';
import 'package:traveller/data/data_manager.dart';
import 'package:traveller/widget/pages/auth.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 177, 197),
      appBar: AppBar(
        title: Text(
          "TRAVELER",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        shadowColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 14, 40, 62),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
              controller: _controller,
              itemCount: DataManager.contents.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        DataManager.contents[index].image,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      SizedBox(height: 30),
                      Text(
                        DataManager.contents[index].title,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        DataManager.contents[index].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 14, 40, 62),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 55,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: TextButton(
              child: Text(
                currentIndex == DataManager.contents.length - 1
                    ? "CONTINUE"
                    : "NEXT",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                if (currentIndex == DataManager.contents.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Auth()),
                  );
                } else {
                  _controller?.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
