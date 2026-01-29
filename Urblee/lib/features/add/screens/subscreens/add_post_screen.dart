import 'package:flutter/material.dart';
import '../../widgets/add_section_title.dart';
import '../../widgets/add_input_field.dart';
import '../../widgets/add_action_tile.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const AddSectionTitle('Post'),

          const AddInputField(
            label: 'Title',
            hint: 'What is this post about?',
            icon: Icons.title_outlined,
          ),

          const SizedBox(height: 16),

          const AddInputField(
            label: 'Content',
            hint: 'Share your thoughts with the community',
            icon: Icons.edit_outlined,
            maxLines: 6,
          ),

          const SizedBox(height: 24),

          const AddSectionTitle('Extras'),

          AddActionTile(
            icon: Icons.photo_library_outlined,
            title: 'Add images',
            subtitle: 'Optional',
            onTap: () {},
          ),

          const SizedBox(height: 12),

          AddActionTile(
            icon: Icons.place_outlined,
            title: 'Attach location',
            subtitle: 'Optional',
            onTap: () {},
          ),

          const SizedBox(height: 32),

          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Publish Post'),
            ),
          ),
        ],
      ),
    );
  }
}
