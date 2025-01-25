 import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';


 class  ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const id = 'profile_screen';
  
  @override
  Widget build(BuildContext context) {
   return 
   Scaffold(
    body: SingleChildScrollView(
    child: 
    Padding(
        padding: EdgeInsets.all(16.0,)
        ,child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Row(
                    children: [
                        CircleAvatar(
                            radius: 40,
                            backgroundImage: null,
                            ),
                            SizedBox(width: 20,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    'data', style: TextStyle( fontSize: 24, 
                                        fontWeight: FontWeight.bold,
                                        ),),
                                        SizedBox(height: 5),
                      Row(
                        children: [
                            IconButton(
                                icon: Icon(Icons.search, 
                                color: Colors.black,
                                ),
                                onPressed: () {
                                  
                                },
                                ),
                                SizedBox(width: 10,
                                ),
                                IconButton(
                                    icon: Icon(Icons.notifications,
                                    ),
                                    onPressed: () {
                                      
                                    },
                                ),
                                SizedBox(height: 10,),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),],),
                        ),
                ),
                GridView.count
            );
  }
 }

