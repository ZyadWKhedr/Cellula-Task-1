abstract class PredictionRepository {
  Future<String> getPrediction(List<double> features);
}
