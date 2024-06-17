import 'package:flutter/material.dart';

class UpdatingLanguageOverlay extends StatelessWidget {
  const UpdatingLanguageOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(), // Loader indicator
          SizedBox(height: 16.0), // Spacing between loader and text
          Text(
            "Updating language",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
