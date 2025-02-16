import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeatherByCity {
  final WeatherRepository repository;

  GetWeatherByCity(this.repository);

  Future<Weather> call(String city) async {
    return await repository.getWeatherByCity(city);
  }
}
