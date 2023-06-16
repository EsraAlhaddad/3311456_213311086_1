import 'package:flutter/material.dart';
import 'package:traveller/data/data_manager.dart';

class CityDetailsBottomBar extends StatelessWidget {
  int id;
  CityDetailsBottomBar({required this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 14, 40, 62),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DataManager.Details[id].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 230, 0),
                          size: 23,
                        ),
                        Text(
                          DataManager.Details[id].starCount,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  DataManager.Details[id].discription,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
