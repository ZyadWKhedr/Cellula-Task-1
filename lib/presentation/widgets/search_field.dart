import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weather_provider.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityController = TextEditingController();

    return TextField(
      controller: cityController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter city name",
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            ref.read(cityProvider.notifier).state = cityController.text;
          },
        ),
      ),
      onSubmitted: (value) {
        if (value != '') {
          ref.read(cityProvider.notifier).state = value;
        }
      },
    );
  }
}
