import 'dart:convert';
import 'package:http/http.dart' as http;

class PredictionService {
  static const String apiUrl = "http://127.0.0.1:5000/predict";

  Future<int> getPrediction(List<int> features) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"features": features}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse["prediction"]; // Returns 0 or 1
      } else {
        throw Exception("Failed to get prediction");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
