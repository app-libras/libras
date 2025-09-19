import 'package:flutter/material.dart';
import 'package:librar/presentation/viewmodels/score_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:librar/presentation/viewmodels/aulas_viewmodel.dart';
import 'package:librar/presentation/viewmodels/materials_viewmodel.dart';
import 'package:provider/provider.dart';

class CongratulationsWidget extends StatelessWidget {
  final MaterialsViewModel materialsViewModel;

  const CongratulationsWidget({super.key, required this.materialsViewModel});

  @override
  Widget build(BuildContext context) {
    final aula = context.watch<AulasViewModel>().aulaAtive;
    bool isAtividade = aula.name == 'Atividade';
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.secondary, // Um fundo suave para celebrar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Ícone de celebração
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(
                    Icons
                        .celebration, // Ou Icons.check_circle, Icons.emoji_events
                    color: Colors.lightGreen[700],
                    size: 100.0,
                  ),
                  Lottie.asset(
                    'assets/animations/congratulations.json',
                    repeat: false,
                    reverse: true,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 30.0), // Espaçamento
              // Título de parabéns
              const Text(
                'Parabéns!',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0), // Espaçamento
              // Mensagem de sucesso
              Text(
                'Você concluiu a aula ${aula.name} com sucesso e está mandando muito bem em Libras!',
                style: TextStyle(fontSize: 20.0, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0), // Espaçamento
              // Botão para continuar ou ir para a próxima etapa
              isAtividade
                  ? ElevatedButton(
                      onPressed: () async {
                        context.read<AulasViewModel>().nextAula();
                        final aula = context.read<AulasViewModel>().aulaAtive;
                        context
                            .read<MaterialsViewModel>()
                            .loadMaterialsByAulaId(
                              aula.id,
                              aula.step,
                              aula.name,
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.lightGreen, // Cor do botão
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Continuar Aprendendo',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 20.0), // Espaçamento
              ElevatedButton(
                onPressed: () {
                  context.read<AulasViewModel>().aulaFinish();
                  context.read<ScoreViewModel>().updateScoreLevel(
                    context.read<ScoreViewModel>().score.first.level + 1,
                  );
                  context.read<MaterialsViewModel>().setToDefault();
                  context.read<AulasViewModel>().setToDefault();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  // foregroundColor: Colors,
                  backgroundColor: Colors.white, // Cor do botão
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Tela Inicial',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
