import 'package:dio/dio.dart';
import '../../domain/entities/weather.dart';

/// Abstract class to define the contract for fetching weather data.
abstract class WeatherRemoteDataSource {
  Future<Weather> getWeatherByCity(String city);
  Future<Weather> getWeatherByLocation(double lat, double lon);
}

/// Implementation of the remote data source using OpenWeather API.
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;
  final String apiKey = "1b04a4fd2bab844f4cf9fc51dfcf1121";

  WeatherRemoteDataSourceImpl({required this.dio});

  @override
  Future<Weather> getWeatherByCity(String city) async {
    try {
      final response = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather",
        queryParameters: {"q": city, "appid": apiKey, "units": "metric"},
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      throw Exception("Error fetching city weather: $e");
    }
  }

  @override
  Future<Weather> getWeatherByLocation(double lat, double lon) async {
    try {
      final response = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather",
        queryParameters: {
          "lat": lat,
          "lon": lon,
          "appid": apiKey,
          "units": "metric"
        },
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      throw Exception("Error fetching location weather: $e");
    }
  }
}
