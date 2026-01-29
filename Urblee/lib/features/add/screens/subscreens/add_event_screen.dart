import 'package:flutter/material.dart';
import '../../widgets/add_section_title.dart';
import '../../widgets/add_input_field.dart';
import '../../widgets/add_action_tile.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const AddSectionTitle('Basic Info'),

          const AddInputField(
            label: 'Event name',
            hint: 'e.g. Open Mic Night',
            icon: Icons.event_outlined,
          ),

          const SizedBox(height: 16),

          const AddInputField(
            label: 'Category',
            hint: 'Music, Tech, Meetup...',
            icon: Icons.category_outlined,
          ),

          const SizedBox(height: 24),

          const AddSectionTitle('Date & Time'),

          AddActionTile(
            icon: Icons.calendar_today_outlined,
            title: 'Select date',
            onTap: () {},
          ),

          const SizedBox(height: 12),

          AddActionTile(
            icon: Icons.schedule_outlined,
            title: 'Select time',
            onTap: () {},
          ),

          const SizedBox(height: 24),

          const AddSectionTitle('Location'),

          const AddInputField(
            label: 'Venue / Address',
            hint: 'Where is the event?',
            icon: Icons.place_outlined,
            maxLines: 2,
          ),

          const SizedBox(height: 24),

          const AddSectionTitle('Details'),

          const AddInputField(
            label: 'Description',
            hint: 'Tell people what this event is about',
            icon: Icons.description_outlined,
            maxLines: 4,
          ),

          const SizedBox(height: 16),

          AddActionTile(
            icon: Icons.photo_library_outlined,
            title: 'Add event images',
            subtitle: 'Optional',
            onTap: () {},
          ),

          const SizedBox(height: 32),

          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Submit Event'),
            ),
          ),
        ],
      ),
    );
  }
}
