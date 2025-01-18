import 'package:flutter/material.dart';



class Profile extends StatefulWidget{
  const Profile({super.key});
  
  @override
  State <Profile>  createstate() => ProfileState();
}

class ProfileScreenState extends StatelessWidget {
  // Example user data
  // final Map<String, String> user = {
  //   'name': 'John Doe',
  //   'email': 'johndoe@example.com',
  //   'phone': '+1 234 567 890',
  //   'address': '123 Main St, Springfield, USA',
  //   'bio': 'Software Developer | Flutter Enthusiast | Open Source Contributor',
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/profile_picture.jpg'), // Add a profile picture in assets
              child: Icon(Icons.person,
                  size: 60, color: Colors.white), // Fallback icon
            ),
            SizedBox(height: 20),

            // User Name
            Text(
              user['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // User Email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  user['email']!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),

            // User Phone
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  user['phone']!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),

            // User Address
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  user['address']!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20),

            // User Bio
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  user['bio']!,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
