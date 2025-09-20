import 'package:flutter/material.dart';
import 'package:librar/presentation/methods/app_bar.dart';
import 'package:librar/presentation/viewmodels/aulas_viewmodel.dart';
import 'package:librar/presentation/viewmodels/materials_viewmodel.dart';
import 'package:librar/presentation/viewmodels/score_viewmodel.dart';
import 'package:provider/provider.dart';

class PresentationAtividadeWidget extends StatefulWidget {
  const PresentationAtividadeWidget({
    super.key,
    required this.materialsViewModel,
  });

  final MaterialsViewModel materialsViewModel;

  @override
  State<PresentationAtividadeWidget> createState() =>
      _PresentationAtividadeWidgetState();
}

Future<void> _showMyDialog(
  BuildContext context,
  TextEditingController controller,
  Function nextAtividadeQuestion,
) async {
  String selectedAnswer = context
      .read<MaterialsViewModel>()
      .selectedAnswerAtividade
      .toLowerCase();
  String currentQuestion = context
      .read<MaterialsViewModel>()
      .materialAtive!
      .name
      .toLowerCase();

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
        color: isCorrect
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
                                  color: Theme.of(
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
                                    text: context
                                        .read<MaterialsViewModel>()
                                        .materialAtive!
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
                            : 'Na próxima você acerta',
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
                  nextAtividadeQuestion();
                  controller.clear();
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

class _PresentationAtividadeWidgetState
    extends State<PresentationAtividadeWidget> {
  final TextEditingController _answerController = TextEditingController();

  void _nextMaterial(BuildContext context) {
    final aulasViewModel = context.read<AulasViewModel>();
    final currentStep = aulasViewModel.aulaAtive.step;
    final newStep = widget.materialsViewModel.isFinalMaterial
        ? widget.materialsViewModel.indexOfLastMaterial
        : currentStep + 1;
    aulasViewModel.updateAulaStep(newStep);
    context.read<AulasViewModel>().updateAulaStep(
      widget.materialsViewModel.materialAtive!.isMaterial + 1,
    );
    widget.materialsViewModel.nextMaterial();
  }

  // void _previousMaterial(BuildContext context) {
  //   final aulasViewModel = context.read<AulasViewModel>();
  //   final currentStep = aulasViewModel.aulaAtive.step;
  //   final newStep = widget.materialsViewModel.isFirstMaterial
  //       ? 1
  //       : currentStep - 1;
  //   aulasViewModel.updateAulaStep(newStep);
  //   widget.materialsViewModel.previousMaterial();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context,
        'Exercícios de ${context.watch<AulasViewModel>().aulaAtive.name}',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('Qual é a palavra?', style: TextStyle(fontSize: 30)),
                // Text(
                //   'Digita sua resposta',
                //   style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                // ),
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                        child: Container(
                          width: double.infinity,
                          height:
                              MediaQuery.of(context).viewInsets.bottom != 0.0
                              ? 300
                              : 400,
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: ClipRRect(
                            child: Image.asset(
                              widget.materialsViewModel.materialAtive!.path,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Digita sua resposta:',
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
                    child: TextField(
                      controller: _answerController,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      // textAlign: TextAlign.center,
                      // readOnly: true,
                      // enabled: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        hint: Text(
                          'Digite sua resposta',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onChanged: (value) => context
                          .read<MaterialsViewModel>()
                          .onChangeSelectedAnswerAtividade(value),
                    ),
                  ),
                ),
              ],
            ),
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
                  if (_answerController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Digite a resposta.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        backgroundColor: Colors.orange.shade100,
                      ),
                    );
                    return;
                  }
                  _showMyDialog(
                    context,
                    _answerController,
                    () => _nextMaterial(context),
                  );
                  // _answerController.clear();
                },
                child: Row(
                  children: [
                    Text('Confirmar', style: TextStyle(fontSize: 20)),
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
