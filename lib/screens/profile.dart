// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const id = 'profile_screen';

  final String userName = "John Doe";
  final String userEmail = "johndoe@example.com";
  final String userBio = "Software Developer | Flutter Enthusiast";
  final String profileImageUrl = "https://via.placeholder.com/150";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height:  250,
              width:   200,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow:[ BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
               ),
               ],
               ),
            ),
            ],
              
              // backgroundImage: CachedNetworkImageProvider(profileImageUrl),
            ),
            
            SizedBox(height: 20),
            Text( 
              "Olá,$userName",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                userBio,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(
                Icons.favorite, 
                color: Colors.blue,
                ),
              title: 
              Text('Seus Favoritos', 
              style: 
              TextStyle(color: Colors.black, 
              fontWeight: FontWeight.normal),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.black),
              title: Text('Editar Sua conta'),
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.orange),
              title: Text('Software Developer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for editing profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}