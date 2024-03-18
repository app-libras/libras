// import 'package:flutter/material.dart';
// import 'package:fluttermoji/fluttermoji.dart';

// class ProfileAvatar extends StatefulWidget {
//    const ProfileAvatar ({super.key});

//   @override
//   _ProfileAvatarState createState() => _ProfileAvatarState();
//   }

//   class _ProfileAvatarState extends State<ProfileAvatar> {
//   String? _fluttermojiSvg;

//   @override
//   void initState() {
//     super.initState();
//     _generateFluttermoji();
//   }

//   void _generateFluttermoji() async {
//     String svg = await FluttermojiFunctions().encode();
//     setState(() {
//       _fluttermojiSvg = svg;
//     });
//   }
  
//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Profile Picture'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _fluttermojiSvg != null
//                 ? FluttermojiSvg(
//                     svg: _fluttermojiSvg!,
//                     width: 150,
//                     height: 150,
//                   )
//                 : CircularProgressIndicator(),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _generateFluttermoji,
//               child: Text('Create Profile Picture'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }