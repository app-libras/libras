import 'package:flutter/material.dart';
import 'package:libras/screens/get_user_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const id = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildProfileItem('Name', _getUserName.name),
            // _buildProfileItem('Address', userProfile.address),
            // _buildProfileItem('Email', userProfile.email),
            // _buildProfileItem('Phone Number', userProfile.phoneNumber),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
