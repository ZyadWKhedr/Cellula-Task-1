import 'package:cellula_task1/core/api_client.dart';
import 'package:cellula_task1/data/repositories/predection_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PredictionNotifier extends StateNotifier<AsyncValue<String>> {
  final PredictionRepositoryImpl repository;

  PredictionNotifier(this.repository) : super(const AsyncValue.loading());

  Future<void> fetchPrediction(List<double> features) async {
    state = const AsyncValue.loading();
    try {
      final prediction = await repository.getPrediction(features);
      state = AsyncValue.data(prediction);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}

// Riverpod Provider
final predictionProvider = StateNotifierProvider<PredictionNotifier, AsyncValue<String>>(
  (ref) => PredictionNotifier(ref.read(predictionRepositoryProvider)),
);

final predictionRepositoryProvider = Provider(
  (ref) => PredictionRepositoryImpl(ApiClient()),
);
