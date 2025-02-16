import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherByCity(String city);
  Future<Weather> getWeatherByLocation(double lat, double lon);
}
