import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/widget/home/home_bottom_bar_widget.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen();

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _sizeAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/welcome_screen.jpg"),
              fit: BoxFit.cover,
              opacity: 0.7,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: _opacityAnimation.value,
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Opacity(
                      opacity: _opacityAnimation.value,
                      child: Text(
                        "Traveling Around The World",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Opacity(
                      opacity: _opacityAnimation.value,
                      child: Text(
                        "“The world is a book and those who do not travel read only one page",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeBottomBar()),
                        );
                      },
                      child: Ink(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Transform.scale(
                          scale: _sizeAnimation.value,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
