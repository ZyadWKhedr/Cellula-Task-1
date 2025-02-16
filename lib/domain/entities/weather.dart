class Weather {
  final String city;
  final double temperature;
  final String date;
  final double windSpeed;
  final int humidity;

  Weather({
    required this.city,
    required this.temperature,
    required this.date,
    required this.windSpeed,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
      date: DateTime.now().toString(),
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
    );
  }
}
