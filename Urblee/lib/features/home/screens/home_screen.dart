import 'package:flutter/material.dart';
import '../widgets/place_card.dart';
import '../data/dummy_places.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urblee'),
      ),

      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(13),
        itemCount: dummyPlaces.length,
        itemBuilder: (context, index) {
          final place = dummyPlaces[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PlaceCard(place: place),
          );
        },
      ),


    );
  }
}

//