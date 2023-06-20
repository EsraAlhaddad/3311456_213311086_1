import 'package:flutter/material.dart';
import 'package:traveller/widget/pages/network.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future myWeather;
  @override
  void initState() {
    super.initState();
    myWeather = FethcData().call('konya');
  }

  TextEditingController _searchController = TextEditingController();
  var focusNode = FocusNode();
  @override
  void dispose() {
    focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 177, 197),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width: 0.8),
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 14, 40, 62),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30,
                                color: Color.fromARGB(255, 14, 40, 62),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                },
                              ),
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) async {
                              var fetchData = await FethcData().call('$value');
                              if (fetchData is StatusRequest) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromARGB(255, 14, 40, 62),
                                      title: Text(
                                        "City Not Found",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 198, 177, 197),
                                        ),
                                      ),
                                      content: Text(
                                        "please check the city name",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 198, 177, 197),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 198, 177, 197),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                myWeather = FethcData().call('$value');
                                setState(() {});
                                Fluttertoast.showToast(
                                  msg: "Data Fetched Successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black.withOpacity(.4),
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                      future: myWeather,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Visibility(
                            visible: snapshot.hasError == true ? false : true,
                            replacement: Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(60),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data!.name,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 14, 40, 62),
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    snapshot.data!.Humidity[0]['main']
                                        .toString(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 14, 40, 62),
                                      fontSize: 22,
                                      letterSpacing: 1.3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Today',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 14, 40, 62),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 250,
                                    width: 250,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/cloudy.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Heat',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 40, 62),
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Text(
                                            '${snapshot.data!.Current['temp'].toStringAsFixed(2)}°',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 40, 62),
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        children: [
                                          const Text(
                                            'Wind',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 40, 62),
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Text(
                                            '${snapshot.data!.wind['speed']} km/h',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 40, 62),
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        children: [
                                          const Text(
                                            'Humidity',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 40, 62),
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Text(
                                            '${snapshot.data!.Current['humidity']}%',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 40, 62),
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Text(
                                    'Today is a day to travel!',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 14, 40, 62),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Text('Veriler yüklenemedi..');
                        } else {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
