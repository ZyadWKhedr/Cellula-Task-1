class Weather {
  final String city;
  final double temperature;
  final String date;
  final double windSpeed;
  final int humidity;
  final int prediction; // 1 = Go Out, 0 = Don't Go Out

  Weather({
    required this.city,
    required this.temperature,
    required this.date,
    required this.windSpeed,
    required this.humidity,
    required this.prediction,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    double temp = json['main']['temp'].toDouble();
    int humidity = json['main']['humidity'];
    double windSpeed = json['wind']['speed'].toDouble();

    return Weather(
      city: json['name'],
      temperature: temp,
      date: DateTime.now().toString(),
      windSpeed: windSpeed,
      humidity: humidity,
      prediction: _predictWeather(temp, humidity, windSpeed), // Get Prediction
    );
  }

  /// Convert Weather object to AI model input (5 binary features)
  List<int> toAIInput() {
    return [
      _isRainy() ? 1 : 0, // outlook is rainy
      _isSunny() ? 1 : 0, // outlook is sunny
      _isHot() ? 1 : 0, // temperature is hot
      _isMild() ? 1 : 0, // temperature is mild
      _isHumidityNormal() ? 1 : 0, // humidity is normal
    ];
  }

  bool _isRainy() => city.toLowerCase().contains("rain"); // Simulated
  bool _isSunny() => !city.toLowerCase().contains("rain"); // Simulated
  bool _isHot() => temperature > 25; // Hot if temp > 25°C
  bool _isMild() =>
      temperature >= 15 && temperature <= 25; // Mild if 15°C - 25°C
  bool _isHumidityNormal() =>
      humidity >= 30 && humidity <= 60; // Normal if 30%-60%

  /// **Prediction Logic**
  static int _predictWeather(double temp, int humidity, double windSpeed) {
    if (temp > 35 || humidity > 85 || windSpeed > 50) {
      return 0; // Don't Go Out (Extreme weather)
    }
    if (temp < 5) {
      return 0; // Too Cold, Don't Go Out
    }
    if (humidity < 20 && temp > 30) {
      return 0; // Too Dry & Hot, Don't Go Out
    }
    return 1; // Otherwise, Go Out
  }
}
