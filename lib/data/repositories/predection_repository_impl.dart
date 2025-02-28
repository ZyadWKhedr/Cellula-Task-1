

import 'package:cellula_task1/core/api_client.dart';
import 'package:cellula_task1/domain/repositories/predicition_repository.dart';

class PredictionRepositoryImpl implements PredictionRepository {
  final ApiClient apiClient;

  PredictionRepositoryImpl(this.apiClient);

  @override
  Future<String> getPrediction(List<double> features) async {
    final response = await apiClient.post("/predict", {"features": features});
    return response["prediction"].toString();
  }
}
