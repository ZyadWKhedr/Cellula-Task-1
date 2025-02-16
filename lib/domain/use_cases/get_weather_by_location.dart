import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeatherByLocation {
  final WeatherRepository repository;

  GetWeatherByLocation(this.repository);

  Future<Weather> call(double lat, double lon) async {
    return await repository.getWeatherByLocation(lat, lon);
  }
}
