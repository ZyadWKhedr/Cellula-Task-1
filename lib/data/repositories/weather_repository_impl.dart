import 'package:cellula_task1/data/data_sources/weather_remote_data_source.dart';
import 'package:cellula_task1/domain/entities/weather.dart';
import 'package:cellula_task1/domain/repositories/weather_repository.dart';

/// Repository implementation that interacts with the data source.
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Weather> getWeatherByCity(String city) async {
    return await remoteDataSource.getWeatherByCity(city);
  }

  @override
  Future<Weather> getWeatherByLocation(double lat, double lon) async {
    return await remoteDataSource.getWeatherByLocation(lat, lon);
  }
}
