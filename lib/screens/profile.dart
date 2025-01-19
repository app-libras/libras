import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const id = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 30, 
          left: 20, 
          right: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 30,)
                ],
              )
            ],
          ),
      ),
   );
  }}