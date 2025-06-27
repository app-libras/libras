import 'package:flutter/material.dart';
import 'package:libras/presentation/methods/app_bar.dart';
import 'package:libras/presentation/viewmodels/aulas_viewmodel.dart';
import 'package:libras/presentation/viewmodels/materials_viewmodel.dart';
import 'package:libras/presentation/viewmodels/score_viewmodel.dart';
import 'package:provider/provider.dart';

class ExerciseWidget extends StatefulWidget {
  const ExerciseWidget({super.key, required this.materialsViewModel});

  final MaterialsViewModel materialsViewModel;


  @override
  State<ExerciseWidget> createState() => _ExerciseWidgetState();
}

 
Future<void> _showMyDialog(BuildContext context) async {
  int selectedAnswer = context.read<MaterialsViewModel>().selectedAnswer;
  int currentQuestion = context.read<MaterialsViewModel>().currentQuestion!.id;

  bool isCorrect = selectedAnswer == currentQuestion;

  if (isCorrect && !context.read<AulasViewModel>().aulaAtive.isFinish) {
    int points = context.read<ScoreViewModel>().score[0].points + 10;
    await context.read<ScoreViewModel>().updateScorePoints(points);
  }

  return showModalBottomSheet<void>(
    // ignore: use_build_context_synchronously
    context: context,
    barrierColor: Colors.transparent,
    elevation: 1,
    isDismissible: false,
    builder: (BuildContext context) {
      return Container(
        height:
            MediaQuery.of(context).size.height *
            0.22, // Adjust height as needed
        color:
            isCorrect
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.onError,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: isCorrect ? Colors.green : Colors.red,
                    radius: 30,
                    child: Icon(
                      isCorrect ? Icons.check : Icons.close,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isCorrect ? 'Parabéns!' : 'Resposta errada',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      isCorrect
                          ? const SizedBox(height: 10)
                          : RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).textTheme.titleMedium?.color,
                                // fontSize: 20,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'A resposta correta: ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextSpan(
                                  text:
                                      context
                                          .read<MaterialsViewModel>()
                                          .currentQuestion!
                                          .name,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),

                      Text(
                        isCorrect
                            ? 'Sua resposta está correta!'
                            : 'Na próxima você acertar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150, 50),
                ),
                child: const Text('Continuar', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<MaterialsViewModel>().nextQuestion();
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}


class _ExerciseWidgetState extends State<ExerciseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context,
        'Exercícios de ${context.read<AulasViewModel>().aulaAtive.name}',
      ),
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
                        widget.materialsViewModel.currentQuestion!.path,
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
                          in widget.materialsViewModel.currentQuestion!.answer)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                widget.materialsViewModel.selectedAnswer ==
                                        answer.id
                                    ? Colors.green.shade100
                                    : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side:
                                widget.materialsViewModel.selectedAnswer ==
                                        answer.id
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
                                widget.materialsViewModel.selectedAnswer) {
                              widget.materialsViewModel.selectAnswer(answer.id);
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  elevation: 1,
                  backgroundColor: Colors.green[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (widget.materialsViewModel.selectedAnswer == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Selecione uma resposta.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        backgroundColor: Colors.orange.shade100,
                      ),
                    );
                    return;
                  }
                  _showMyDialog(context);
                },
                child: Row(
                  children: [
                    Text('Feito', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 10),
                    Icon(Icons.check, color: Colors.deepOrange, size: 28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
