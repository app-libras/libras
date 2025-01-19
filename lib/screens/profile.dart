import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const id = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double weight = MediaQuery.of(context).size.height;
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
                  size: 30,),
                  Spacer(),
                  Icon(Icons.menu,
                  color: Colors.black,
                  size: 30,
                  ),
                ],
              ),
              SizedBox(height: 0.03,),
              Row(
                children: [
                  Column(children: [
                    Text('Kofi Manu!',
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.black,
                    ),
                    ),
                    Text('idade',
                    style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.normal, 
                      color: Colors.black,
                    ),
                    ),
                    Text('idade',
                    style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.normal, 
                      color: Colors.black,
                    ),
                    ),
                  ],),
                  Spacer(),
                  Container(
                    height: height * 0.12,
                    width:    150,
                    decoration: BoxDecoration(color: Color.fromARGB(1, 68, 192, 250),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[
                      BoxShadow(
                    color : Color.fromARGB(1, 68, 192, 250).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3)
                    ),])
                  ),
                ],
              )
            ],
          ),
      ),
   );
  }}