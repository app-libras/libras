//  import 'dart:ui';

// import 'package:flutter/material.dart';
// // import 'package:cached_network_image/cached_network_image.dart';


//  class  ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   static const id = 'profile_screen';
  
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
 
// }
//  final String userName = "John Doe";
//  final String userBio = "Aulas de Libras";

//  Widget _buildTile(IconData icon, String title, String subtitle, Color color) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: color),
//             SizedBox(height: 10),
//             Text(
//               title,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               subtitle,
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }



//    Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Perfil'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               // to be able to change details
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/profile_picture.png'), // Add your image asset
//             ),],),),
//             SizedBox(height: 10),
//             Text(
//               'Olá!' + userName,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             ],
//             ),
//             ),
//             SizedBox(height: 20,),
        
//         //    Column(crossAxisAlignment: 
//         //    CrossAxisAlignment.start,
//         //    children: [Text(userName),
//         //    SizedBox(height: 10,
//         //    ),
//         //    ],
//         //    ),
//            Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 userBio,
//                 style: TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(height: 30),
//             Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: 
//             GridView.count(
//                 shrinkWrap: true,
//                 physics: AlwaysScrollableScrollPhysics(),
//                 crossAxisCount: 2, 
//                 crossAxisSpacing: 10, 
//                 mainAxisSpacing: 10, 
//                 childAspectRatio: 1.5,
//                 children: [
//                         _buildTile(Icons.phone, 'Phone', '+1 234 567 890', Colors.blue),
//                         _buildTile(Icons.location_on, 'Location', 'New York, USA', Colors.green),
//                         _buildTile(Icons.work, 'Job', 'Software Developer', Colors.orange),
//                         _buildTile(Icons.cake, 'Birthday', 'Jan 1, 1990', Colors.purple),
//                 ],
//                 ),),
                                               
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add functionality for editing profile
//               },
//               child: Text('Edit Profile'),
//             ),
          
//         );
      
    
//   }
