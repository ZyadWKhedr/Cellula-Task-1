import 'package:cellula_task1/data/data_sources/weather_remote_data_source.dart';
import 'package:cellula_task1/data/repositories/weather_repository_impl.dart';
import 'package:cellula_task1/domain/use_cases/get_weather_by_city.dart';
import 'package:cellula_task1/domain/use_cases/get_weather_by_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/weather.dart';

import 'package:dio/dio.dart';

// Repository Provider
final weatherRepositoryProvider = Provider<WeatherRepositoryImpl>((ref) {
  final dataSource = WeatherRemoteDataSourceImpl(dio: Dio());
  return WeatherRepositoryImpl(remoteDataSource: dataSource);
});

// UseCase Providers
final getWeatherByCityProvider = Provider<GetWeatherByCity>((ref) {
  return GetWeatherByCity(ref.watch(weatherRepositoryProvider));
});

final getWeatherByLocationProvider = Provider<GetWeatherByLocation>((ref) {
  return GetWeatherByLocation(ref.watch(weatherRepositoryProvider));
});

// City Provider
final cityProvider = StateProvider<String>((ref) => "Cairo");

// Fetch Weather By City
final weatherProvider = FutureProvider<Weather>((ref) async {
  final getWeatherByCity = ref.watch(getWeatherByCityProvider);
  final city = ref.watch(cityProvider);
  return getWeatherByCity(city);
});
