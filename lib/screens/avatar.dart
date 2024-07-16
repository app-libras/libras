// // import 'dart:html';

// import 'package:flutter/material.dart';

// class AvatarSelect extends StatefulWidget {
//   const AvatarSelect({super.key});

//   @override
//   _AvatarSelectState createState() => _AvatarSelectState();
// }

// class _AvatarSelectState extends State<AvatarSelect> {
//   String? _selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Center(
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             ),
//             ),
//             );
//   }

//   @override
//   void _selectImageFromAssets(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Image'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text('Image 1'),
//                 onTap: () {
//                   setState(() {
//                     _selectedImage = 'assets/image1.png';
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text('Image 2'),
//                 onTap: () {
//                   setState(() {
//                     _selectedImage = 'assets/image2.png';
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//               // Add more list tiles for additional images as needed
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
