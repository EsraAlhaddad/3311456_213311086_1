import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {
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
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 40, 62),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color.fromARGB(255, 155, 53, 45),
              ),
              Text(
                "Türkiye",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 40, 62),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.search,
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
