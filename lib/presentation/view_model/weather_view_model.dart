import 'package:cellula_task1/domain/entities/weather.dart';
import 'package:cellula_task1/domain/use_cases/get_weather_by_city.dart';
import 'package:cellula_task1/domain/use_cases/get_weather_by_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherViewModel extends StateNotifier<AsyncValue<Weather?>> {
  final GetWeatherByCity getWeatherByCity;
  final GetWeatherByLocation getWeatherByLocation;

  WeatherViewModel({
    required this.getWeatherByCity,
    required this.getWeatherByLocation,
  }) : super(const AsyncValue.loading());

  /// Fetch weather data by city name
  Future<void> fetchWeatherByCity(String city) async {
    state = const AsyncValue.loading();
    try {
      final weather = await getWeatherByCity(city);
      state = AsyncValue.data(weather);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// Fetch weather data by GPS location (latitude & longitude)
  Future<void> fetchWeatherByLocation(double lat, double lon) async {
    state = const AsyncValue.loading();
    try {
      final weather = await getWeatherByLocation(lat, lon);
      state = AsyncValue.data(weather);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
