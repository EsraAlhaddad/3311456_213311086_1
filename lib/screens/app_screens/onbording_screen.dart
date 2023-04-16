import 'package:flutter/material.dart';
import 'package:traveller/data/data_manager.dart';
import 'login_screen.dart';

class Onbording extends StatefulWidget {
  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentINDEX = 0;

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
                      currentINDEX = val;
                    });
                  },
                  controller: _controller,
                  itemCount: DataManager.contents.length,
                  itemBuilder: (dartCobject, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Image.asset(
                            DataManager.contents[i].image,
                            height: 300,
                          ),
                          Text(
                            DataManager.contents[i].title,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            DataManager.contents[i].discription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 40, 62),
                  borderRadius: BorderRadius.circular(20)),
              height: 55,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: TextButton(
                child: Text(
                  currentINDEX == DataManager.contents.length - 1
                      ? "CONTİNUE"
                      : "NEXT",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  if (currentINDEX == DataManager.contents.length - 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Login(),
                        ));
                  } else {
                    _controller?.nextPage(
                      duration: Duration(microseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
