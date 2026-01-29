import 'package:flutter/material.dart';

import 'custom_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _ProfileHeader(),

          const SizedBox(height: 30),

          _SectionTitle("Account"),
          CustomListTile(
            leadingIcon: Icons.person_outline,
            title: "Edit Profile",
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: Icons.lock_outline,
            title: "Privacy",
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: Icons.key_outlined,
            title: "Security",
            onTap: () {},
          ),

          const SizedBox(height: 24),

          _SectionTitle("Preferences"),
          CustomListTile(
            leadingIcon: Icons.notifications_none,
            title: "Notifications",
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: Icons.language,
            title: "Language",
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: Icons.dark_mode_outlined,
            title: "Dark Mode",
            trailing: Switch(
              value: false,
              onChanged: (_) {},
            ),
            onTap: () {},
          ),

          const SizedBox(height: 24),

          _SectionTitle("More"),
          CustomListTile(
            leadingIcon: Icons.help_outline,
            title: "Help & Support",
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: Icons.info_outline,
            title: "About Urblee",
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: Icons.logout,
            title: "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 36,
          backgroundImage: AssetImage('lib/icons/bala.jpg'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Varshit Kommi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "varshit@gmail.com",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.edit_outlined,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}

