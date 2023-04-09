import 'package:flutter/material.dart';

class CityDetailsAppBar extends StatefulWidget {
  @override
  State<CityDetailsAppBar> createState() => _CityDetailsAppBarState();
}

class _CityDetailsAppBarState extends State<CityDetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 40, 62),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 40, 62),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
