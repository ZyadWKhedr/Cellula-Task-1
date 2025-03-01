
import 'package:cellula_task1/domain/entities/weather.dart';

abstract class PredictionRepository {
  Future<int> getPrediction(Weather weather);
}
