class Weather {
  final String name;
  final String location;
  var Current;
  var wind;
  var Humidity;

  Weather({
    required this.location,
    required this.Current,
    required this.name,
    required this.Humidity,
    required this.wind,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      wind: json['wind'],
      Humidity: json['weather'],
      Current: json['main'],
      location: "",
    );
  }
}
