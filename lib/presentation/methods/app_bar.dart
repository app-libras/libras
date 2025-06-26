import 'package:flutter/material.dart';
// import 'package:libras/presentation/viewmodels/score_viewmodel.dart';
// import 'package:provider/provider.dart';

AppBar myAppBar(BuildContext context, String title) {
  // final score = context.select<ScoreViewModel, int>(
  //   (ScoreViewModel vm) => vm.score.first.points,
  // );
  return AppBar(
    title: Text(title, style: const TextStyle(fontSize: 30)),
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context),
    ),
    // actions: [
    //   Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       alignment: Alignment.center,
    //       decoration: BoxDecoration(
    //         color: Colors.green,
    //         borderRadius: BorderRadius.circular(50),
    //         // shape: BoxShape.circle,
    //       ),
    //       height: 50,
    //       width: 50,
    //       child: Text('$score'),
    //     ),
    //   ),
    // ],
  );
}
