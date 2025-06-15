import 'package:flutter/material.dart';
import 'package:libras/presentation/viewmodels/materials_viewmodel.dart';

class ExerciseOfMaterials extends StatelessWidget {
  const ExerciseOfMaterials({super.key, required this.materialsViewModel});

  final MaterialsViewModel materialsViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('Que sinal esse?', style: TextStyle(fontSize: 30)),
          Text(
            'Escolha a resposta correta abaixo',
            style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
          ),

          const SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Image.asset(
                    materialsViewModel.materialAtive!.path,
                    height: 380,
                    width: double.infinity,
                    // fit: BoxFit.fitWidth,
                    // scale: 1.6,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Sua resposta:',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Center(
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Text(
                    materialsViewModel.materialAtive!.name,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
