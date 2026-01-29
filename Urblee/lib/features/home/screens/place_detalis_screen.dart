import 'package:flutter/material.dart';

import '../widgets/place_card.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place['name']),
      ),
      body: ListView(
        children: [
          // IMAGE PLACEHOLDER
          Container(

            height: 280,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                size: 87,
                color: Colors.grey,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAME
                Text(
                  place['name'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // DISTANCE
                Row(
                  children: [
                    const Icon(Icons.place_outlined, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      place['distance'],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // VISIBILITY
                const Text(
                  'Visibility',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: place['visibility'],
                    minHeight: 10,
                    backgroundColor: Colors.grey.shade300,
                    color: visibilityColor(place['visibility']),
                  ),

                ),

                const SizedBox(height: 30),

                // PLACEHOLDER DESCRIPTION
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This is a placeholder description. '
                      'Later this will come from backend or CMS.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
