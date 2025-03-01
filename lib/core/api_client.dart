import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.151.196:5001"; // Change for real device

  static Future<int?> getPrediction(Map<String, dynamic> weatherData) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/predict"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(weatherData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["prediction"]; // 0 or 1
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
