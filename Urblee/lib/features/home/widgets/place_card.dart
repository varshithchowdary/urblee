import 'package:flutter/material.dart';

import '../screens/place_detalis_screen.dart';

class PlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlaceDetailsScreen(place: place),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE / VISUAL BLOCK
            Container(
              height: 360,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: const Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 42,
                  color: Colors.grey,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAME + MAP ICON (OPPOSITE SIDES)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          place['name'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.map_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // DISTANCE
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        place['distance'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // VISIBILITY METER
                  _VisibilityMeter(value: place['visibility']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _VisibilityMeter extends StatelessWidget {
  final double value;

  const _VisibilityMeter({required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Visibility',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: Colors.grey.shade300,
            color: visibilityColor(value),
          ),
        ),
      ],
    );
  }
}

Color visibilityColor(double value) {
  if (value > 0.7) return Colors.green;
  if (value > 0.4) return Colors.orange;
  return Colors.red;
}
