import 'package:flutter/material.dart';
import 'package:libras/presentation/methods/app_bar.dart';
import 'package:libras/presentation/viewmodels/materials_viewmodel.dart';
import 'package:provider/provider.dart';

class ExerciseOfMaterials extends StatelessWidget {
  const ExerciseOfMaterials({super.key, required this.materialsViewModel});

  final MaterialsViewModel materialsViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: SafeArea(
        child: Padding(
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
                        materialsViewModel.currentQuestion!.path,
                        height: 320,
                        width: double.infinity,
                        // fit: BoxFit.fitWidth,
                        // scale: 1.6,
                      ),
                    ),
                    // SizedBox(height: 10),
                    Text(
                      'Sua resposta:',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      for (var answer
                          in materialsViewModel.currentQuestion!.answer)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                materialsViewModel.selectedAnswer == answer.id
                                    ? Colors.green.shade100
                                    : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side:
                                materialsViewModel.selectedAnswer == answer.id
                                    ? const BorderSide(color: Colors.green)
                                    : const BorderSide(color: Colors.grey),

                            // minimumSize: const Size(100, 50),
                            elevation: 1,
                            padding: const EdgeInsets.only(
                              left: 6,
                              right: 6,
                              top: 10,
                              bottom: 10,
                            ),
                          ),
                          child: Text(
                            answer.answer,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            if (answer.id !=
                                materialsViewModel.selectedAnswer) {
                              materialsViewModel.selectAnswer(answer.id);
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 50),
              elevation: 1,
              backgroundColor: Colors.green[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: context.read<MaterialsViewModel>().nextQuestion,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Feito', style: TextStyle(fontSize: 20)),
                const SizedBox(width: 10),
                Icon(Icons.check, color: Colors.deepOrange, size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
