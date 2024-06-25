import 'dart:math';

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  static final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        _generateImageUrl(),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Icon(Icons.error, color: Colors.red),
          );
        },
      ),
    );
  }

  String _generateImageUrl() {
    int photoId = _random.nextInt(30) + 55;
    int sizeMultiplier =
        photoId % 7 + 1; // Ensuring sizeMultiplier is at least 1
    return "https://picsum.photos/id/$photoId/300/${200 * sizeMultiplier}";
  }
}
