import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:traveller/models/weather_model.dart';

enum StatusRequest {
  success,
  failure,
}

Future<Either<StatusRequest, Weather>> fetchData(String city) async {
  final response = await http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=${city}&&units=metric&appid=2548e6d05bfbee7b7ef1413a1d34bae4"));
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return Right(Weather.fromJson(json));
  } else {
    return Left(StatusRequest.failure);
  }
}

class FethcData {
  call(city) async {
    var res = await fetchData(city);
    return res.fold((l) => l, (r) => r);
  }
}
