import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartPage extends StatefulWidget {
  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  double rotationAngle = 0;

  final List<PieChartSectionData> pieChartData = [
    PieChartSectionData(
      color: Colors.red,
      value: 35,
      title: 'İstanbul',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 10,
      title: 'Ankara',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.blue,
      value: 25,
      title: 'Trabzon',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 15,
      title: 'Antalya',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.yellow,
      value: 10,
      title: 'İzmir',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.purple,
      value: 5,
      title: 'Konya',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 177, 197),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 40, 62),
        title: Text('Touristic Distribution'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                rotationAngle += details.delta.dx / 10;
              });
            },
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: pieChartData,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Distribution:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: pieChartData.length,
              itemBuilder: (context, index) {
                final data = pieChartData[index];
                return ListTile(
                  leading: Container(
                    width: 20,
                    height: 20,
                    color: data.color,
                  ),
                  title: Text(data.title),
                  trailing: Text('${data.value}%'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PieChartPage(),
  ));
}
