import 'package:cellula_task1/core/const/app_colors.dart';
import 'package:cellula_task1/core/const/dimensions.dart';
import 'package:cellula_task1/core/widgets/custom_text_widget.dart';
import 'package:cellula_task1/presentation/providers/weather_provider.dart';
import 'package:cellula_task1/presentation/widgets/search_field.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);
    final city = ref.watch(cityProvider);
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";

    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight(context),
        width: Dimensions.screenWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Hello',
                  fontSize: Dimensions.font50(context),
                  color: AppColors.teritaryColor,
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: Dimensions.height20(context)),
                SearchField(),
                SizedBox(height: Dimensions.height50(context)),
                weatherAsync.when(
                  data: (weather) {
                    String day = DateFormat('EEEE').format(DateTime.now());
                    String date =
                        DateFormat('d MMM yyyy').format(DateTime.now());
                    String time = DateFormat('h:mm a').format(DateTime.now());

                    // Determine Prediction
                    String prediction =
                        weather.prediction == 1 ? "✅ Go Out" : "❌ Don't Go Out";

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: Dimensions.height10(context)),
                        CustomText(
                          text: "$date • $time",
                          color: Colors.white54,
                        ),

                        CustomText(
                          text: city,
                          fontSize: Dimensions.font50(context) * 1.5,
                        ),

                        const SizedBox(height: 20),

                        CustomText(
                          text: "${weather.temperature}°C",
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),

                        SizedBox(height: Dimensions.height10(context)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.water_drop,
                                    color: Colors.white),
                                CustomText(
                                  text: "${weather.humidity}%",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: "Humidity",
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                const Icon(Icons.air, color: Colors.white),
                                CustomText(
                                  text: "${weather.windSpeed} km/h",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: "Wind Speed",
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions.height20(context)),

                        // Display Prediction
                        CustomText(
                          text: "Prediction:",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: prediction,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: weather.prediction == 1
                              ? Colors.green
                              : Colors.red,
                        ),
                      ],
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                  error: (error, _) => Center(
                    child: Text(
                      "Error: $error",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
